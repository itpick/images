#!/usr/bin/env python3
"""Parse IMAGE-POPULARITY.md → popularity.json.

Reads the markdown table at the top of IMAGE-POPULARITY.md and emits a JSON
object keyed by image name. Pull and star strings are preserved verbatim
(units intact — e.g. "15.3B", "21.3K") so the renderer can show them as-is.

Output schema (per key):
    {
      "rank":      int,
      "pulls":     str | null,   # e.g. "15.3B", or null when blank
      "stars":     str | null,   # e.g. "21.3K", or null when blank
      "used":      bool,         # true when the "used" cell contains a check mark
      "tagStatus": str           # e.g. "versioned", "latest-only"
    }
"""
import argparse
import json
import sys
from pathlib import Path


def split_row(line: str) -> list[str] | None:
    """Split a markdown table row into trimmed cell values, or None if not a
    data row. Strips the surrounding pipes and any trailing newline."""
    s = line.strip()
    if not s.startswith("|") or not s.endswith("|"):
        return None
    # Drop the leading and trailing pipes, then split.
    cells = [c.strip() for c in s[1:-1].split("|")]
    return cells


def is_data_row(cells: list[str]) -> bool:
    """A data row has its first cell as an integer rank.

    The header row's first cell is `#`, and the separator row's first cell
    is something like `---:` — neither parses as int.
    """
    if not cells:
        return False
    try:
        int(cells[0])
        return True
    except ValueError:
        return False


def normalize_metric(cell: str) -> str | None:
    """Empty / dash cells -> None; otherwise the trimmed string verbatim."""
    if not cell or cell in {"-", "—", "–"}:
        return None
    return cell


def parse(path: Path) -> dict[str, dict]:
    """Parse the markdown file at `path` and return the popularity dict."""
    out: dict[str, dict] = {}
    for raw in path.read_text().splitlines():
        cells = split_row(raw)
        if cells is None or not is_data_row(cells):
            continue
        # Expected columns (7): rank, name, software/repo, pulls, stars, used,
        # tag_status. Be defensive — pad to 7 with empties if a row is short.
        if len(cells) < 7:
            cells = cells + [""] * (7 - len(cells))
        rank_s, name, _repo, pulls, stars, used, tag_status = cells[:7]
        try:
            rank = int(rank_s)
        except ValueError:
            continue
        if not name:
            continue
        out[name] = {
            "rank": rank,
            "pulls": normalize_metric(pulls),
            "stars": normalize_metric(stars),
            # Common check marks people paste into markdown cells.
            "used": used in {"✓", "✔", "yes", "Y", "y", "x", "X"},
            "tagStatus": tag_status or None,
        }
    return out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--in", dest="inp", required=True, help="IMAGE-POPULARITY.md path")
    ap.add_argument("--out", required=True, help="popularity.json output path")
    args = ap.parse_args()

    src = Path(args.inp)
    if not src.exists():
        print(f"parse-popularity: input not found: {src}", file=sys.stderr)
        return 1

    data = parse(src)
    Path(args.out).write_text(json.dumps(data, indent=2, sort_keys=True))
    print(f"parse-popularity: wrote {len(data)} entries -> {args.out}",
          file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
