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
import re
import subprocess
import sys
import datetime
import urllib.parse
from pathlib import Path


def category_slug(category: str) -> str:
    """Map a category string to a CSS class slug."""
    if not category:
        return "unknown"
    s = category.lower().replace(" ", "-").replace("_", "-")
    allowed = {"runtime", "build-env", "database", "web-service",
               "devops-tool", "utility", "shell"}
    return s if s in allowed else "unknown"


def _strip_build_info_section(md_text: str) -> str:
    """Drop the `## Build Information` section from a README.

    scripts/generate-readmes.py emits a boilerplate "Build Information"
    table into every generated README with placeholder values (`N/A`,
    `unknown`) or stale local-build snapshots (e.g. `Build Time | 2s`).
    None of that is meaningful to the site, so the description tab on
    every per-image page renders an empty-looking section.

    This strips the section by line-walking: when we hit a heading
    matching `## Build Information` (case-insensitive), skip lines until
    the next `## ` heading or EOF. Trailing blank lines from the section
    boundary are collapsed so the next heading doesn't acquire weird
    spacing.
    """
    out: list[str] = []
    in_section = False
    for line in md_text.splitlines():
        stripped = line.strip()
        if not in_section and stripped.lower() == "## build information":
            in_section = True
            continue
        if in_section:
            if stripped.startswith("## "):
                in_section = False
                # fall through so this next heading is kept
            else:
                continue
        out.append(line)
    return "\n".join(out)


def render_markdown(md_text: str, cmark_bin: str) -> str:
    """Convert markdown to HTML using cmark."""
    if not md_text or not md_text.strip():
        return "<p class='text-fg-muted italic'>No README available.</p>"
    cleaned = _strip_build_info_section(md_text)
    p = subprocess.run([cmark_bin, "--unsafe"],
                       input=cleaned, capture_output=True, text=True, check=True)
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


_CVE_LIST_MAX = 100  # cap per-image; truncation note disclosed in UI.
_SEVERITY_ORDER = {"critical": 0, "high": 1, "medium": 2, "low": 3, "unknown": 4}


def scan_for_image(image_name: str, scan_dir: str | None) -> dict | None:
    """Return a dict of severity counts + per-CVE detail (or None)."""
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
    cves: list[dict] = []
    for result in doc.get("Results", []) or []:
        for vuln in result.get("Vulnerabilities", []) or []:
            sev = (vuln.get("Severity") or "UNKNOWN").lower()
            if sev in counts:
                counts[sev] += 1
            else:
                counts["unknown"] += 1
            cves.append({
                "id": vuln.get("VulnerabilityID", "") or "",
                "severity": (vuln.get("Severity") or "UNKNOWN").upper(),
                "package": vuln.get("PkgName", "") or "",
                "installed": vuln.get("InstalledVersion", "") or "",
                "fixed": vuln.get("FixedVersion", "") or "",
                "title": vuln.get("Title", "") or vuln.get("Description", "") or "",
            })
    # Sort by severity (critical first) then CVE ID descending.
    cves.sort(key=lambda v: (_SEVERITY_ORDER.get(v["severity"].lower(), 99), v["id"]),
              reverse=False)
    counts["total"] = sum(counts[s] for s in ("critical", "high", "medium", "low", "unknown"))
    counts["scannedAt"] = doc.get("CreatedAt", "")
    counts["sourceFile"] = os.path.basename(target)
    counts["cves"] = cves
    return counts


def render_cve_list(cves: list[dict]) -> str:
    """Render a `<details>`-wrapped table of CVE rows (collapsed by default).

    CVE IDs link to NIST NVD detail pages. Capped at _CVE_LIST_MAX entries with
    a truncation note above the table when exceeded."""
    if not cves:
        return ""
    total = len(cves)
    shown = cves[:_CVE_LIST_MAX]
    truncated_note = ""
    if total > _CVE_LIST_MAX:
        truncated_note = (
            f'<p class="text-xs text-fg-muted mb-2 italic">Showing first '
            f'{_CVE_LIST_MAX} of {total} total CVEs (sorted critical → low).</p>'
        )
    rows = "\n".join(
        f"<tr>"
        f'<td><a href="https://nvd.nist.gov/vuln/detail/{_html_escape(c["id"])}" '
        f'target="_blank" rel="noopener" class="text-accent-ok hover:underline font-mono">'
        f'{_html_escape(c["id"])}</a></td>'
        f'<td class="font-mono uppercase text-xs">{_html_escape(c["severity"])}</td>'
        f"<td>{_html_escape(c['package'])}</td>"
        f"<td class=\"font-mono text-xs\">{_html_escape(c['installed'])}</td>"
        f"<td class=\"font-mono text-xs\">{_html_escape(c['fixed']) or '—'}</td>"
        f"<td>{_html_escape(c['title'])}</td>"
        f"</tr>"
        for c in shown
    )
    return (
        f'<details class="mt-4">'
        f'<summary class="cursor-pointer text-sm font-semibold text-fg-primary mb-2">'
        f'Show vulnerability list ({total} CVE{"s" if total != 1 else ""})'
        f'</summary>'
        f'{truncated_note}'
        f'<table class="prose mt-3">'
        f'<thead><tr><th>CVE</th><th>Severity</th><th>Package</th>'
        f'<th>Installed</th><th>Fixed</th><th>Title</th></tr></thead>'
        f'<tbody>{rows}</tbody>'
        f'</table>'
        f'</details>'
    )


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


def _extract_license(art: dict) -> str:
    """Best-effort license display string from a syft artifact entry.

    Syft's native JSON gives a `licenses[]` array where each entry has
    `spdxExpression` (preferred — canonical SPDX form) and a free-text
    `value` fallback. We dedupe across the array and join with commas;
    empty arrays render as an empty string so the caller can fall back
    to "—" for visual consistency in the table.
    """
    seen: list[str] = []
    for lic in art.get("licenses") or []:
        token = (lic.get("spdxExpression") or lic.get("value") or "").strip()
        if token and token not in seen:
            seen.append(token)
    return ", ".join(seen)


def sbom_for_image(image_name: str, sbom_dir: str | None) -> list[dict] | None:
    """Return a list of {name, version, type, license} package dicts from a syft
    SBOM, or None if no usable file exists.

    Syft writes one JSON per image alongside trivy reports inside the same
    artifact, with the name pattern `<image>_<tag>-sbom.json`. When several
    files match (e.g. multiple tags), we pick the lex-greatest filename — the
    same tie-breaker `scan_for_image` uses, so the SBOM and vulnerability
    panels line up.

    License coverage is sparse for our Nix-built packages — most rows render
    as empty. Upstream Go/NPM/etc. packages picked up by syft typically have
    SPDX licenses populated.
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
            "license": _extract_license(art),
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


# How many tags to render at the top of the Tags panel before stuffing the
# remainder into a collapsible. Most images have well under 10, but heavy
# branch-tagging history can push it higher; cap keeps the page snappy.
_TAGS_MAX_ROWS = 30


def tags_for_image(image_name: str, tags_dir: str | None) -> list[dict] | None:
    """Return a list of {tag, digest, pushed_at} dicts written by
    deploy-website.yml's GHCR-API fetcher, or None if the file is absent
    or unreadable. Empty arrays return as None — the caller's placeholder
    handles the "no tags yet" state."""
    if not tags_dir:
        return None
    target = os.path.join(tags_dir, f"{image_name}.json")
    if not os.path.isfile(target):
        return None
    try:
        with open(target) as f:
            doc = json.load(f)
    except (OSError, json.JSONDecodeError):
        return None
    if not isinstance(doc, list) or not doc:
        return None
    return doc


def lookup_tags(image_name: str, tags_dir: str | None) -> list[dict] | None:
    """Same variant-folding as `lookup_sbom`: -fips/-iamguarded/-nonroot
    suffixes fall through to the base image when no exact tags file is
    present."""
    if not tags_dir:
        return None
    found = tags_for_image(image_name, tags_dir)
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
                found = tags_for_image(base, tags_dir)
                if found is not None:
                    return found
    return None


def _looks_like_commit_sha(tag: str) -> bool:
    """A bare 40-hex tag is the commit-SHA tag that local-build-push.sh
    writes per build. Useless on a catalog card (e.g.
    '91bee4f56879ec28c0d0a93fac12cafa09172832'); the version-tag is what
    we want. Cheaper than importing re for a one-shot check."""
    if len(tag) != 40:
        return False
    return all(c in "0123456789abcdef" for c in tag.lower())


def _format_digest(digest: str) -> str:
    """Trim sha256:abcdef0123… → abcdef012345 for display, keeping the
    full digest available as a tooltip."""
    if not digest:
        return ""
    short = digest.split(":", 1)[1] if ":" in digest else digest
    return short[:12]


def _format_size_bytes(size) -> str:
    """Render a compressed-size byte count as a short human string
    (e.g. 73411977 → '70 MB'). Returns '—' for None/0/missing.

    Uses 1024-based units to match how `docker images` reports sizes,
    so a user comparing the panel to their CLI sees the same number."""
    if not size or size <= 0:
        return '<span class="opacity-60">—</span>'
    units = ["B", "KB", "MB", "GB", "TB"]
    value = float(size)
    idx = 0
    while value >= 1024 and idx < len(units) - 1:
        value /= 1024.0
        idx += 1
    # Below MB use no decimals (small images); MB+ use 1 decimal place.
    if idx >= 2:
        return f"{value:.1f} {units[idx]}"
    return f"{value:.0f} {units[idx]}"


def render_tags_panel(tags: list[dict] | None, image_name: str) -> str:
    """Render the Tags panel HTML — table of tag/digest/pushed-at.

    Missing data shows a placeholder that explains the image hasn't been
    published yet (vs. "no data available"); empties from a published
    image are rare since `latest` is always present.
    """
    if not tags:
        return (
            '<p class="text-fg-muted italic text-sm">'
            'No published tags yet — image hasn\'t been built or hasn\'t '
            'finished its first publish.'
            '</p>'
        )
    total = len(tags)
    rows = tags[:_TAGS_MAX_ROWS]
    note = ""
    if total > _TAGS_MAX_ROWS:
        note = (
            f'<p class="text-fg-muted text-xs mb-2">'
            f'Showing first {_TAGS_MAX_ROWS} of {total} tags.'
            f'</p>'
        )
    body_rows = "\n".join(
        f"<tr>"
        f"<td class=\"font-mono\"><code class=\"text-fg-primary\">{_html_escape(t.get('tag', ''))}</code></td>"
        f"<td class=\"font-mono text-fg-muted text-xs\" title=\"{_html_escape(t.get('digest', ''))}\">{_html_escape(_format_digest(t.get('digest', '')))}</td>"
        f"<td class=\"font-mono text-fg-muted text-xs\" title=\"On-the-wire pull size\">{_format_size_bytes(t.get('compressed_size'))}</td>"
        f"<td class=\"font-mono text-fg-muted text-xs\" title=\"Size on disk after pull (decompressed)\">{_format_size_bytes(t.get('uncompressed_size'))}</td>"
        f"<td class=\"text-fg-muted text-xs\">{_html_escape(format_scan_timestamp(t.get('pushed_at', '')))}</td>"
        f"</tr>"
        for t in rows
    )
    pull_hint = (
        f'<p class="text-xs text-fg-muted mb-3">'
        f'Pull any tag with '
        f'<code class="font-mono text-fg-primary">'
        f'docker pull ghcr.io/nix-containers/images/{_html_escape(image_name)}:&lt;tag&gt;'
        f'</code>'
        f'</p>'
    )
    return (
        f'{pull_hint}'
        f'{note}'
        f'<div class="prose max-w-none">'
        f'<table>'
        f'<thead><tr><th>Tag</th><th>Digest</th><th>Compressed</th><th>Uncompressed</th><th>Pushed</th></tr></thead>'
        f'<tbody>{body_rows}</tbody>'
        f'</table>'
        f'</div>'
    )


def render_sbom(sbom: list[dict] | None, *, image_name: str | None = None,
                link_packages: bool = False, base: str = "/") -> str:
    """Render the SBOM panel HTML.

    When `link_packages` is true, each package name links to
    `<base>packages/?q=<name>` so a user can click through to see every
    other image that includes the same package. The query-string route
    is handled client-side by packages/index.html — no per-package
    HTML page needed.
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

    def _name_cell(name_text: str) -> str:
        esc = _html_escape(name_text)
        if link_packages and name_text:
            href = f"{base}packages/?q={urllib.parse.quote(name_text)}"
            return (
                f'<a href="{href}" '
                f'class="text-accent-ok hover:underline font-mono" '
                f'title="See other images that include {esc}">{esc}</a>'
            )
        return esc

    body_rows = "\n".join(
        f"<tr><td class=\"font-mono\">{_name_cell(r['name'])}</td>"
        f"<td class=\"font-mono\">{_html_escape(r['version'])}</td>"
        f"<td class=\"text-fg-muted\">{_html_escape(r['type'])}</td>"
        f"<td class=\"text-fg-muted text-xs\">{_html_escape(r.get('license', '')) or '<span class=\"opacity-60\">—</span>'}</td></tr>"
        for r in rows
    )
    return (
        f'{truncated_note}'
        f'<div class="prose max-w-none">'
        f'<table>'
        f'<thead><tr><th>Name</th><th>Version</th><th>Type</th><th>License</th></tr></thead>'
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


_UPSTREAM_LABELS = (
    "org.opencontainers.image.source",
    "org.opencontainers.image.url",
    "io.nix-containers.image.upstream",
)


def upstream_url(img: dict) -> str:
    """Best-effort upstream project URL for an image, from its default.nix.

    Priority: explicit OCI source/url/upstream label > meta homepage >
    fetchFromGitHub owner/repo > first `# https://` comment > the nixpkgs
    package's meta.homepage (resolved at site-gen time into nixpkgsHomepage)."""
    nix = img.get("nixCode", "") or ""
    for lbl in _UPSTREAM_LABELS:
        m = re.search(r'"' + re.escape(lbl) + r'"\s*=\s*"(https?://[^"]+)"', nix)
        if m:
            return m.group(1)
    m = re.search(r'homepage\s*=\s*"(https?://[^"]+)"', nix)
    if m:
        return m.group(1)
    m = re.search(
        r'fetchFromGitHub\s*\{.*?owner\s*=\s*"([^"]+)".*?repo\s*=\s*"([^"]+)"',
        nix, re.S,
    )
    if m:
        return f"https://github.com/{m.group(1)}/{m.group(2)}"
    m = re.search(r'#\s*(https?://\S+)', nix)
    if m:
        return m.group(1).rstrip(").,")
    return (img.get("nixpkgsHomepage", "") or "").strip()


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
    ap.add_argument("--tags-data", default=None,
                    help="Optional path to directory of <image>.json files "
                         "(written by deploy-website.yml from GHCR API). "
                         "Drives the Tags tab on per-image pages.")
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
    # Accumulators for the homepage's size stat cards.
    # `total_compressed_bytes` is the sum of each image's latest-tag
    # compressed size (on-the-wire pull cost). `total_uncompressed_bytes`
    # is the corresponding decompressed-on-disk total — useful for
    # capacity planning when running every image. `sized_image_count`
    # tracks how many images contributed (not every image has tags-data).
    total_compressed_bytes = 0
    total_uncompressed_bytes = 0
    sized_image_count = 0
    # Packages index: aggregate every image's SBOM into a map of
    # (name, version, type) → set of images that include it. Drives
    # both the homepage 'unique packages' stat card and the searchable
    # /packages/ directory page generated below.
    pkg_index: dict[tuple[str, str, str], set[str]] = {}
    total_package_instances = 0
    for img in data["images"]:
        name = img["name"]
        readme_html = render_markdown(img.get("readme", ""), args.cmark)
        nix_html = render_nix(img.get("nixCode", ""), args.pygmentize)
        pop_record = lookup_popularity(name, popularity)
        upstream = upstream_url(img)
        upstream_html = (
            f'<a href="{_html_escape(upstream)}" target="_blank" rel="noopener" '
            f'class="text-accent-ok hover:underline">Upstream ↗</a>'
            if upstream else ""
        )
        # Resolve the version we display on the per-image page (and reuse
        # for the catalog card later). Pull from tags-data when we have
        # a real :version tag; otherwise fall back to whatever generate-site.nix
        # could extract statically. See _looks_like_commit_sha for filtering
        # out the immutable 40-hex commit-SHA tag local-build-push.sh writes.
        tags_for_version = lookup_tags(name, args.tags_data)
        static_version = img.get("version", "latest")
        display_version = static_version
        if (display_version == "latest" or display_version.startswith("dynamic-")) and tags_for_version:
            for t in tags_for_version:
                tag_name = t.get("tag", "")
                if tag_name and tag_name != "latest" and not _looks_like_commit_sha(tag_name):
                    display_version = tag_name
                    break
        mapping = {
            "NAME": name,
            "UPSTREAM_HTML": upstream_html,
            "DESCRIPTION": img.get("description", ""),
            "CATEGORY": img.get("category", "unknown"),
            "CATEGORY_SLUG": category_slug(img.get("category", "")),
            "VERSION": display_version,
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
                '<div class="text-xs text-fg-muted mt-2">'
                'Source: '
                # Link the source filename to the security-scan workflow page
                # where the artifact came from. Clicking takes the user to a
                # list of runs; the latest contains the JSON used here.
                f'<a href="https://github.com/nix-containers/images/actions/workflows/security-scan.yml" '
                f'target="_blank" rel="noopener" class="text-accent-ok hover:underline font-mono">'
                f'{_html_escape(scan["sourceFile"])}</a>'
                '</div>'
                '</div>'
                f'{render_cve_list(scan.get("cves", []))}'
            )
        else:
            scan_body = '<p class="text-fg-muted italic text-sm">No scan data yet for this image. It will be picked up on the next scheduled run.</p>'
        mapping["SCAN_PANEL_HTML"] = meta_banner + scan_body

        sbom = lookup_sbom(name, args.sbom_data)
        mapping["SBOM_HTML"] = meta_banner + render_sbom(
            sbom, image_name=name, link_packages=True, base=base
        )
        if sbom:
            total_package_instances += len(sbom)
            for pkg in sbom:
                key = (pkg.get("name", ""), pkg.get("version", ""), pkg.get("type", ""))
                if not key[0]:
                    continue
                pkg_index.setdefault(key, set()).add(name)

        # tags-data was already fetched up top for version resolution.
        tags = tags_for_version
        mapping["TAGS_HTML"] = render_tags_panel(tags, name)

        # Capture this image's "minimal size" from the latest tag —
        # both compressed (on-the-wire pull cost) and uncompressed
        # (on-disk extracted cost). Multiple tags may share a digest
        # (and therefore both sizes), so picking any tag is fine; the
        # latest is what users conventionally pull.
        def _pick(field: str) -> int:
            if not tags:
                return 0
            for t in tags:
                if t.get("tag") == "latest" and t.get(field):
                    return t[field]
            for t in tags:
                if t.get(field):
                    return t[field]
            return 0
        latest_compressed = _pick("compressed_size")
        latest_uncompressed = _pick("uncompressed_size")
        total_compressed_bytes += latest_compressed
        total_uncompressed_bytes += latest_uncompressed
        if latest_compressed > 0:
            sized_image_count += 1

        page_html = fill_template(image_template, mapping)
        page_dir = out / "images" / name
        page_dir.mkdir(parents=True, exist_ok=True)
        (page_dir / "index.html").write_text(page_html)

        slim_images.append({
            "name": name,
            "description": img.get("description", ""),
            "category": img.get("category", "unknown"),
            "categorySlug": category_slug(img.get("category", "")),
            "version": display_version,
            "hasTest": img.get("hasTest", False),
            "fromNixpkgs": img.get("fromNixpkgs", False),
            "upstreamUrl": upstream,
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

    # Upstream-size estimate. Most nix-containers images come in 3-7x
    # smaller than the equivalent Alpine/Debian-based upstream container
    # (no shell, no init system, minimal runtime closure). Until we have
    # a curated nix→docker-hub mapping per image, use a conservative
    # representative multiplier — 4.5x — so the comparison number is
    # accurate to within a factor of two for the published set.
    _UPSTREAM_SIZE_MULTIPLIER = 4.5
    # Materialize the packages index. One entry per unique
    # (name, version, type) tuple; `images` is the sorted list of
    # image names that include this exact package.
    packages_list = sorted(
        [
            {
                "name": k[0],
                "version": k[1],
                "type": k[2],
                "images": sorted(images),
                "imageCount": len(images),
            }
            for k, images in pkg_index.items()
        ],
        key=lambda p: (p["name"].lower(), p["version"]),
    )
    unique_package_names = len({p["name"] for p in packages_list})

    slim_data = {
        "totalCount": len(slim_images),
        "images": slim_images,
        "lastUpdated": build_time,
        # Size aggregates for the homepage stat cards. Bytes. null-safe
        # on the front-end: tags-data may be absent on local builds, in
        # which case both totals are 0 and the card renders a placeholder.
        "totalCompressedBytes": total_compressed_bytes,
        "totalUncompressedBytes": total_uncompressed_bytes,
        "sizedImageCount": sized_image_count,
        "estimatedUpstreamBytes": int(total_compressed_bytes * _UPSTREAM_SIZE_MULTIPLIER),
        "upstreamSizeMultiplier": _UPSTREAM_SIZE_MULTIPLIER,
        # Packages stat-card numbers. `uniqueNames` counts distinct
        # software names (e.g. one for `openssl` regardless of how many
        # versions or types appear). `totalEntries` is every
        # (name, version, type) tuple. `totalInstances` is the raw sum
        # across all images' SBOMs — useful for "how many packages are
        # in the entire fleet, counting duplicates per image."
        "totalPackageUniqueNames": unique_package_names,
        "totalPackageEntries": len(packages_list),
        "totalPackageInstances": total_package_instances,
    }
    (out / "images-data.json").write_text(json.dumps(slim_data))

    # Separate, larger packages.json so the homepage doesn't pay the
    # download cost. ~3000 entries × ~5 fields each = ~500 KB.
    (out / "packages.json").write_text(json.dumps({
        "packages": packages_list,
        "uniqueNames": unique_package_names,
        "totalEntries": len(packages_list),
        "totalInstances": total_package_instances,
        "lastUpdated": build_time,
    }))

    rendered_index = fill_template(index_template, {"BASE": base})
    (out / "index.html").write_text(rendered_index)

    # The packages directory page — same template-fill machinery as
    # the index. Client-side JS in /static/packages.js loads packages.json
    # and renders the searchable list; this template is just the shell.
    packages_template_path = Path(args.templates, "packages.html")
    if packages_template_path.exists():
        packages_template = packages_template_path.read_text()
        rendered_packages = fill_template(packages_template, {"BASE": base})
        (out / "packages").mkdir(parents=True, exist_ok=True)
        (out / "packages" / "index.html").write_text(rendered_packages)

    print(
        f"Rendered {len(slim_images)} per-image pages + index "
        f"+ {len(packages_list)} packages ({unique_package_names} unique names) -> {out}",
        file=sys.stderr,
    )


if __name__ == "__main__":
    main()
