#!/usr/bin/env python3
"""Static site renderer for nix-containers website.

Invoked from the Nix buildPhase. Reads:
  - images-data.json (produced by Nix from images/*/default.nix + README)
  - templates/{index,image-page}.html
Writes:
  - <out>/index.html
  - <out>/images/<name>/index.html (one per image)
  - <out>/images-data.json (slim version, no full README HTML)
"""
import argparse
import glob
import json
import os
import subprocess
import sys
import datetime
from pathlib import Path


def category_slug(category: str) -> str:
    """Map a category string to a CSS class slug."""
    if not category:
        return "unknown"
    s = category.lower().replace(" ", "-").replace("_", "-")
    allowed = {"runtime", "build-env", "database", "web-service",
               "devops-tool", "utility", "shell"}
    return s if s in allowed else "unknown"


def render_markdown(md_text: str, cmark_bin: str) -> str:
    """Convert markdown to HTML using cmark."""
    if not md_text or not md_text.strip():
        return "<p class='text-fg-muted italic'>No README available.</p>"
    p = subprocess.run([cmark_bin, "--unsafe"],
                       input=md_text, capture_output=True, text=True, check=True)
    return p.stdout


def render_nix(nix_text: str, pygmentize_bin: str) -> str:
    """Syntax-highlight a Nix file with pygments."""
    if not nix_text:
        return ""
    p = subprocess.run(
        [pygmentize_bin, "-l", "nix", "-f", "html",
         "-O", "style=monokai,noclasses=False,cssclass=highlight,wrapcode=True"],
        input=nix_text, capture_output=True, text=True, check=True)
    return p.stdout


def _find_scan_file(image_name: str, scan_dir: str, suffix: str) -> str | None:
    """Locate one *-`suffix` file for `image_name` in scan_dir.

    security-scan.yml munges the full image ref (e.g.
    ghcr.io/nix-containers/images/postgres:latest) into the filename:
        ghcr.io_nix-containers_images_postgres_latest-trivy.json
    So a 'startswith image-name' glob never matches. We look for
    files where the munged registry-prefix segment ends with the
    image name, then pick the lex-greatest (newest tag).
    """
    # Match files like *_<image>_<tag>-suffix or <image>_<tag>-suffix.
    # The leading `_` in the first pattern enforces a word boundary so
    # `postgres` doesn't match `postgres-fips` files.
    patterns = [
        os.path.join(scan_dir, f"*_{image_name}_*-{suffix}"),
        os.path.join(scan_dir, f"{image_name}_*-{suffix}"),
    ]
    matches: list[str] = []
    for p in patterns:
        matches.extend(glob.glob(p))
    if not matches:
        return None
    # Dedupe + sort. Lex-greatest is typically newest tag (e.g. v2.0 > v1.9
    # for same prefix) and the registry-prefixed file (long name) sorts
    # AFTER the bare-name file, so when both exist we prefer the explicit
    # registry-tagged one — also correct.
    return sorted(set(matches))[-1]


def scan_for_image(image_name: str, scan_dir: str | None) -> dict | None:
    """Return a dict of severity counts (or None if no data exists)."""
    if not scan_dir:
        return None
    target = _find_scan_file(image_name, scan_dir, "trivy.json")
    if not target:
        return None
    try:
        with open(target) as f:
            doc = json.load(f)
    except (OSError, json.JSONDecodeError):
        return None

    counts = {"critical": 0, "high": 0, "medium": 0, "low": 0, "unknown": 0}
    for result in doc.get("Results", []) or []:
        for vuln in result.get("Vulnerabilities", []) or []:
            sev = (vuln.get("Severity") or "UNKNOWN").lower()
            if sev in counts:
                counts[sev] += 1
            else:
                counts["unknown"] += 1
    counts["total"] = sum(counts[s] for s in ("critical", "high", "medium", "low", "unknown"))
    counts["scannedAt"] = doc.get("CreatedAt", "")
    counts["sourceFile"] = os.path.basename(target)
    return counts


# Suffixes folded into a base image when looking up popularity data.
# Applied in order; first match wins. Mirrors the methodology in
# IMAGE-POPULARITY.md, where `-fips`, `-iamguarded`, `-nonroot` variants
# share the popularity record of their base.
_POPULARITY_VARIANT_SUFFIXES = ("-fips", "-iamguarded", "-nonroot")


def next_cve_scan_utc() -> str:
    """Next scheduled CVE scan, derived from security-scan.yml cron '0 6 * * *'.

    Always 06:00 UTC: today's if we're rendering before 06:00 UTC, else
    tomorrow's. Static cron, computed at render time.
    """
    now = datetime.datetime.now(datetime.timezone.utc)
    next_run = now.replace(hour=6, minute=0, second=0, microsecond=0)
    if next_run <= now:
        next_run += datetime.timedelta(days=1)
    return next_run.strftime("%Y-%m-%d %H:%M UTC")


def format_scan_timestamp(iso: str) -> str:
    """Trivy's CreatedAt is ISO-with-nanos; trim to human-readable UTC."""
    if not iso:
        return "never"
    try:
        cleaned = iso.replace("Z", "+00:00")
        # Drop sub-second precision so the banner stays compact.
        if "." in cleaned:
            head, tail = cleaned.split(".", 1)
            if "+" in tail:
                cleaned = head + "+" + tail.split("+", 1)[1]
            else:
                cleaned = head
        dt = datetime.datetime.fromisoformat(cleaned)
        return dt.astimezone(datetime.timezone.utc).strftime("%Y-%m-%d %H:%M UTC")
    except (ValueError, TypeError):
        return iso  # fall back to whatever we got


def is_recent(iso_str: str, days: int = 7) -> bool:
    """True if iso_str is within `days` days of now (UTC). Lenient on
    malformed input — returns False so a bad timestamp never *passes*
    the freshness check (avoids false-positive green dots)."""
    if not iso_str:
        return False
    try:
        cleaned = iso_str.replace("Z", "+00:00")
        if "." in cleaned:
            head, tail = cleaned.split(".", 1)
            cleaned = head + (("+" + tail.split("+", 1)[1]) if "+" in tail else "")
        dt = datetime.datetime.fromisoformat(cleaned).astimezone(datetime.timezone.utc)
        return (datetime.datetime.now(datetime.timezone.utc) - dt) <= datetime.timedelta(days=days)
    except (ValueError, TypeError):
        return False


def scan_meta_banner_html(scan: dict | None, next_scan: str) -> str:
    """Last-scan / next-scan info banner.

    Always renders (even with no scan data) so users know when fresh data
    will arrive. Used at the top of BOTH the Vulnerabilities and SBOM
    tabs."""
    last = format_scan_timestamp(scan.get("scannedAt", "")) if scan else "never"
    return (
        '<p class="text-xs text-fg-muted mb-3 pb-3 border-b border-neutral-800">'
        f'Last scan: <span class="font-mono text-fg-primary">{last}</span>'
        f' · Next scheduled scan: <span class="font-mono text-fg-primary">{next_scan}</span>'
        '</p>'
    )

# Hard cap on SBOM rows rendered per page. Some images (e.g. base OSes with
# every userland tool) have thousands of packages; rendering them all would
# bloat the HTML and slow the page. Anything past this is hidden behind a
# "Showing first N of M" notice.
_SBOM_MAX_ROWS = 500


def sbom_for_image(image_name: str, sbom_dir: str | None) -> list[dict] | None:
    """Return a list of {name, version, type} package dicts from a syft SBOM,
    or None if no usable file exists.

    Syft writes one JSON per image alongside trivy reports inside the same
    artifact, with the name pattern `<image>_<tag>-sbom.json`. When several
    files match (e.g. multiple tags), we pick the lex-greatest filename — the
    same tie-breaker `scan_for_image` uses, so the SBOM and vulnerability
    panels line up.
    """
    if not sbom_dir:
        return None
    target = _find_scan_file(image_name, sbom_dir, "sbom.json")
    if not target:
        return None
    try:
        with open(target) as f:
            doc = json.load(f)
    except (OSError, json.JSONDecodeError):
        return None

    out: list[dict] = []
    for art in doc.get("artifacts", []) or []:
        name = art.get("name")
        if not name:
            continue
        out.append({
            "name": name,
            "version": art.get("version", "") or "",
            "type": art.get("type", "") or "",
        })
    out.sort(key=lambda r: (r["name"].lower(), r["version"]))
    return out


def lookup_sbom(image_name: str, sbom_dir: str | None) -> list[dict] | None:
    """Resolve an SBOM for `image_name`, folding `-fips`/`-iamguarded`/`-nonroot`
    suffixes into the base image when no exact match is found. Mirrors the
    popularity-lookup methodology so variant images don't show empty SBOMs
    when only the base was scanned."""
    if not sbom_dir:
        return None
    found = sbom_for_image(image_name, sbom_dir)
    if found is not None:
        return found
    base = image_name
    changed = True
    while changed:
        changed = False
        for suffix in _POPULARITY_VARIANT_SUFFIXES:
            if base.endswith(suffix) and len(base) > len(suffix):
                base = base[: -len(suffix)]
                changed = True
                found = sbom_for_image(base, sbom_dir)
                if found is not None:
                    return found
    return None


def render_sbom(sbom: list[dict] | None) -> str:
    """Render the SBOM panel HTML.

    Empty/missing data renders the same italic-muted placeholder used by the
    vulnerabilities panel for visual consistency. Otherwise produces a table
    capped at `_SBOM_MAX_ROWS`; if truncated, a tiny note above the table
    discloses the original count.
    """
    if not sbom:
        return '<p class="text-fg-muted italic text-sm">No SBOM data available.</p>'
    total = len(sbom)
    rows = sbom[:_SBOM_MAX_ROWS]
    truncated_note = ""
    if total > _SBOM_MAX_ROWS:
        truncated_note = (
            f'<p class="text-fg-muted text-xs mb-2">'
            f'Showing first {_SBOM_MAX_ROWS} of {total} total packages.'
            f'</p>'
        )
    body_rows = "\n".join(
        f"<tr><td class=\"font-mono\">{_html_escape(r['name'])}</td>"
        f"<td class=\"font-mono\">{_html_escape(r['version'])}</td>"
        f"<td class=\"text-fg-muted\">{_html_escape(r['type'])}</td></tr>"
        for r in rows
    )
    return (
        f'{truncated_note}'
        f'<div class="prose max-w-none">'
        f'<table>'
        f'<thead><tr><th>Name</th><th>Version</th><th>Type</th></tr></thead>'
        f'<tbody>{body_rows}</tbody>'
        f'</table>'
        f'</div>'
    )


def _html_escape(s: str) -> str:
    """Cheap HTML escape — SBOM fields are bag-of-bytes from upstream
    ecosystems, so we cannot trust them to be safe to interpolate raw."""
    return (
        str(s)
        .replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
        .replace('"', "&quot;")
        .replace("'", "&#39;")
    )


def lookup_popularity(image_name: str, table: dict) -> dict | None:
    """Return the popularity record for `image_name`, folding variant suffixes
    (`-fips`, `-iamguarded`, `-nonroot`) into the base name when an exact
    match is missing."""
    if image_name in table:
        return table[image_name]
    base = image_name
    # Strip each known suffix once if present, then re-check. We loop because
    # a name like `foo-iamguarded-fips` should fall back to `foo`.
    changed = True
    while changed:
        changed = False
        for suffix in _POPULARITY_VARIANT_SUFFIXES:
            if base.endswith(suffix) and len(base) > len(suffix):
                base = base[: -len(suffix)]
                changed = True
                if base in table:
                    return table[base]
    return None


def render_popularity(record: dict | None) -> str:
    """Render the popularity row HTML for a per-image page. Empty string when
    the image is not in the ranking table — keeps unranked pages clean."""
    if not record:
        return ""
    parts = [
        f'<span class="badge bg-accent-ok/20 text-accent-ok font-mono">Rank #{record["rank"]}</span>'
    ]
    pulls = record.get("pulls")
    if pulls:
        parts.append(f'<span class="font-mono">~{pulls} pulls</span>')
    stars = record.get("stars")
    if stars:
        parts.append(f'<span class="font-mono">{stars} stars</span>')
    if record.get("used"):
        parts.append(
            '<span class="badge bg-neutral-800 text-fg-muted text-xs">used-by-us</span>'
        )
    inner = "\n  ".join(parts)
    return (
        '<div class="flex items-center gap-3 text-sm text-fg-muted mb-2">\n  '
        + inner
        + "\n</div>"
    )


def fill_template(template: str, mapping: dict) -> str:
    """Mustache-style substitution. {{KEY}} -> mapping[KEY]. Raises if any
    placeholder is left unfilled — better to catch typos at build time."""
    result = template
    for key, value in mapping.items():
        result = result.replace("{{" + key + "}}", str(value))
    import re
    leftover = re.findall(r"\{\{([A-Z_]+)\}\}", result)
    if leftover:
        raise KeyError(f"Unfilled template placeholders: {leftover}")
    return result


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", required=True, help="Path to images-data.json")
    ap.add_argument("--templates", required=True, help="Path to templates/ directory")
    ap.add_argument("--out", required=True, help="Output directory (will be created)")
    ap.add_argument("--cmark", required=True, help="Path to cmark binary")
    ap.add_argument("--pygmentize", required=True, help="Path to pygmentize binary")
    ap.add_argument("--scan-data", default=None,
                    help="Optional path to directory of *-trivy.json files")
    ap.add_argument("--sbom-data", default=None,
                    help="Optional path to directory of *-sbom.json files "
                         "(typically the same dir as --scan-data)")
    ap.add_argument("--popularity", default=None,
                    help="Optional path to popularity.json (output of parse-popularity.py)")
    ap.add_argument("--base-path", default="/",
                    help="URL base path (e.g. '/' locally, '/images/' on GH Pages project site). Trailing slash required.")
    ap.add_argument("--last-build", default=None,
                    help="ISO timestamp of the last successful build-containers.yml run on main. When omitted, freshness-gates assume build is recent.")
    args = ap.parse_args()
    base = args.base_path if args.base_path.endswith("/") else args.base_path + "/"

    popularity: dict = {}
    if args.popularity:
        try:
            with open(args.popularity) as f:
                popularity = json.load(f)
        except (OSError, json.JSONDecodeError) as e:
            print(f"render: failed to load popularity data ({e}); continuing without",
                  file=sys.stderr)
            popularity = {}

    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    (out / "images").mkdir(exist_ok=True)

    with open(args.data) as f:
        data = json.load(f)

    image_template = Path(args.templates, "image-page.html").read_text()
    index_template = Path(args.templates, "index.html").read_text()

    build_time = datetime.datetime.utcnow().strftime("%Y-%m-%d %H:%M UTC")
    next_scan = next_cve_scan_utc()
    # Whether the build-containers.yml pipeline has had a successful run
    # within the last 7 days. Passed via --last-build from the deploy
    # workflow. When unset (local builds), treat as True so the green-dot
    # freshness check doesn't gate everything on a value we don't have.
    build_recent = is_recent(args.last_build) if args.last_build else True

    slim_images = []
    for img in data["images"]:
        name = img["name"]
        readme_html = render_markdown(img.get("readme", ""), args.cmark)
        nix_html = render_nix(img.get("nixCode", ""), args.pygmentize)
        pop_record = lookup_popularity(name, popularity)
        mapping = {
            "NAME": name,
            "DESCRIPTION": img.get("description", ""),
            "CATEGORY": img.get("category", "unknown"),
            "CATEGORY_SLUG": category_slug(img.get("category", "")),
            "VERSION": img.get("version", "latest"),
            "PULL_COMMAND": img.get("pullCommand", f"docker pull ghcr.io/nix-containers/images/{name}:latest"),
            "README_HTML": readme_html,
            "NIX_HTML": nix_html,
            "POPULARITY_HTML": render_popularity(pop_record),
            "BUILD_TIME": build_time,
            "BASE": base,
        }
        used_by = img.get("usedByCharts", []) or []
        if used_by:
            chips = " ".join(
                f'<span class="inline-block bg-bg-input text-fg-primary rounded-full px-3 py-1 text-xs font-mono mr-2 mb-2">{c}</span>'
                for c in used_by
            )
            used_by_html = (
                '<p class="text-fg-muted text-sm mb-3">This image is consumed by:</p>'
                f'<div class="flex flex-wrap">{chips}</div>'
            )
        else:
            used_by_html = '<p class="text-fg-muted italic text-sm">Not used by any tracked chart.</p>'
        mapping["USED_BY_HTML"] = used_by_html
        scan = scan_for_image(name, args.scan_data)
        meta_banner = scan_meta_banner_html(scan, next_scan)
        if scan:
            scan_body = (
                '<div class="space-y-1 text-sm">'
                f'<div class="flex justify-between"><span class="text-accent-bad font-mono">Critical</span><span>{scan["critical"]}</span></div>'
                f'<div class="flex justify-between"><span class="text-accent-warn font-mono">High</span><span>{scan["high"]}</span></div>'
                f'<div class="flex justify-between"><span class="text-fg-muted font-mono">Medium</span><span>{scan["medium"]}</span></div>'
                f'<div class="flex justify-between"><span class="text-fg-muted font-mono">Low</span><span>{scan["low"]}</span></div>'
                f'<div class="text-xs text-fg-muted mt-2">Source: {scan["sourceFile"]}</div>'
                '</div>'
            )
        else:
            scan_body = '<p class="text-fg-muted italic text-sm">No scan data yet for this image. It will be picked up on the next scheduled run.</p>'
        mapping["SCAN_PANEL_HTML"] = meta_banner + scan_body

        sbom = lookup_sbom(name, args.sbom_data)
        mapping["SBOM_HTML"] = meta_banner + render_sbom(sbom)

        page_html = fill_template(image_template, mapping)
        page_dir = out / "images" / name
        page_dir.mkdir(parents=True, exist_ok=True)
        (page_dir / "index.html").write_text(page_html)

        slim_images.append({
            "name": name,
            "description": img.get("description", ""),
            "category": img.get("category", "unknown"),
            "categorySlug": category_slug(img.get("category", "")),
            "version": img.get("version", "latest"),
            "hasTest": img.get("hasTest", False),
            "pullCommand": img.get("pullCommand", ""),
            "usedByCharts": img.get("usedByCharts", []),
            "scan": scan or None,
            # Total package count from the syft SBOM. null when no SBOM data
            # was provided (local builds) or no matching artifact existed.
            # Not currently surfaced on the index, but pre-populated here so
            # a future enhancement can sort/filter by it without re-running
            # the build.
            "sbomCount": (len(sbom) if sbom is not None else None),
            # Popularity fields (rank/pulls/stars/used/tagStatus). null when
            # the image is not in IMAGE-POPULARITY.md. The index page may
            # consume these later to surface rank-sorted lists.
            "popularity": pop_record,
            # Freshness signals consumed by the index page to render a
            # green dot next to images whose data is current. Simplified
            # to: scanned within 7 days AND a successful build pipeline
            # ran within 7 days. SBOM presence used to be required too
            # but the SBOM step in security-scan.yml has a separate bug
            # producing zero files, so we relaxed the requirement.
            "freshness": {
                "scanRecent": is_recent((scan or {}).get("scannedAt", "")),
                "hasSbom": bool(sbom),
                "buildRecent": build_recent,
                "isFresh": (
                    is_recent((scan or {}).get("scannedAt", ""))
                    and build_recent
                ),
            },
        })

    slim_data = {
        "totalCount": len(slim_images),
        "images": slim_images,
        "lastUpdated": build_time,
    }
    (out / "images-data.json").write_text(json.dumps(slim_data))

    rendered_index = fill_template(index_template, {"BASE": base})
    (out / "index.html").write_text(rendered_index)

    print(f"Rendered {len(slim_images)} per-image pages + index -> {out}",
          file=sys.stderr)


if __name__ == "__main__":
    main()
