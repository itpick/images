#!/usr/bin/env python3
"""
Generate README.md and specifications.md for each image folder.

This script reads:
- build-times.json for build timing data
- data-gathering/chainguard-overview-data.json for overview/description info
- data-gathering/chainguard-specifications-data.json for specifications

And generates:
- images/<image>/README.md with overview, build time, and chainguard reference
- images/<image>/specifications.md with Chainguard specifications data
"""

import json
import os
import re
import sys
from pathlib import Path

# Paths
SCRIPT_DIR = Path(__file__).parent
IMAGES_DIR = SCRIPT_DIR.parent / "images"
BUILD_TIMES_FILE = SCRIPT_DIR.parent / "data-gathering" / "build-times.json"
OVERVIEW_DATA_FILE = SCRIPT_DIR.parent / "data-gathering" / "chainguard-overview-data.json"
SPECS_DATA_FILE = SCRIPT_DIR.parent / "data-gathering" / "chainguard-specifications-data.json"


def load_json(filepath):
    """Load JSON file."""
    if not filepath.exists():
        print(f"Warning: {filepath} not found")
        return {}
    with open(filepath, 'r') as f:
        return json.load(f)


def extract_description_from_raw_text(raw_text, image_name):
    """Extract a clean description from the rawText field."""
    if not raw_text:
        return None

    # Try to find the description section
    # Look for patterns like "Chainguard Container for X" followed by description
    patterns = [
        rf"Chainguard Container for {re.escape(image_name)}\s*\n+(.+?)(?:\n\n|Chainguard Containers)",
        r"Minimal Wolfi-based (.+?)(?:\n|Chainguard)",
        r"A minimal,? Wolfi-based (.+?)(?:\n|Chainguard)",
    ]

    for pattern in patterns:
        match = re.search(pattern, raw_text, re.IGNORECASE | re.DOTALL)
        if match:
            desc = match.group(1).strip()
            # Clean up the description
            desc = re.sub(r'\s+', ' ', desc)
            desc = desc.strip('.')
            if len(desc) > 20 and len(desc) < 500:
                return desc

    # Fallback: find any sentence after the image name
    match = re.search(rf"{re.escape(image_name)}\s*\n+([A-Z][^.]+\.)", raw_text)
    if match:
        return match.group(1).strip()

    return None


def get_image_description(overview_data, image_name):
    """Get image description from overview data."""
    # Try exact match
    if image_name in overview_data:
        raw_text = overview_data[image_name].get('rawText', '')
        desc = extract_description_from_raw_text(raw_text, image_name)
        if desc:
            return desc

    # Try with underscores replaced by hyphens
    alt_name = image_name.replace('_', '-')
    if alt_name in overview_data:
        raw_text = overview_data[alt_name].get('rawText', '')
        desc = extract_description_from_raw_text(raw_text, alt_name)
        if desc:
            return desc

    return None


def generate_readme(image_name, build_time_data, overview_data):
    """Generate README.md content for an image."""
    # Get build time info
    build_info = build_time_data.get('images', {}).get(image_name, {})
    build_time = build_info.get('time_human', 'N/A')
    build_status = build_info.get('status', 'unknown')

    # Get description from overview
    description = get_image_description(overview_data, image_name)

    # Build the README
    lines = []
    lines.append(f"# {image_name}")
    lines.append("")

    if description:
        lines.append(description)
        lines.append("")

    # Usage section
    lines.append("## Usage")
    lines.append("")
    lines.append("```bash")
    lines.append("# Build the image")
    lines.append(f"nix build .#{image_name}")
    lines.append("")
    lines.append("# Load into Docker")
    lines.append(f"nix build .#load-{image_name}-to-docker && ./result/bin/load-{image_name}-to-docker")
    lines.append("```")
    lines.append("")

    return "\n".join(lines)


def generate_specifications(image_name, specs_data):
    """Generate specifications.md content for an image."""
    # Get specs for this image
    image_specs = specs_data.get(image_name, {})
    if not image_specs:
        # Try alternative naming
        alt_name = image_name.replace('_', '-')
        image_specs = specs_data.get(alt_name, {})

    specs = image_specs.get('specs', {})

    lines = []
    lines.append(f"# {image_name} Specifications")
    lines.append("")
    lines.append("Container image specifications and configuration details.")
    lines.append("")

    if specs:
        lines.append("## Container Configuration")
        lines.append("")
        lines.append("| Setting | Value |")
        lines.append("|---------|-------|")

        # Standard order for specs
        spec_order = [
            "Has apk?",
            "Has a shell?",
            "User",
            "Working directory",
            "Entrypoint",
            "CMD",
            "Volumes",
            "Stop signal",
            "Environment variables",
        ]

        # Add specs in order
        added = set()
        for key in spec_order:
            if key in specs:
                value = specs[key]
                # Clean up value
                if value == "—":
                    value = "-"
                # Truncate very long values
                if len(str(value)) > 100:
                    value = str(value)[:97] + "..."
                # Escape pipe characters
                value = str(value).replace("|", "\\|")
                lines.append(f"| {key} | {value} |")
                added.add(key)

        # Add any remaining specs not in order
        for key, value in specs.items():
            if key not in added:
                if value == "—":
                    value = "-"
                if len(str(value)) > 100:
                    value = str(value)[:97] + "..."
                value = str(value).replace("|", "\\|")
                lines.append(f"| {key} | {value} |")

        lines.append("")
    else:
        lines.append("*No specifications data available for this image.*")
        lines.append("")

    return "\n".join(lines)


def main():
    print("Loading data files...")
    build_times = load_json(BUILD_TIMES_FILE)
    overview_data = load_json(OVERVIEW_DATA_FILE)
    specs_data = load_json(SPECS_DATA_FILE)

    print(f"Build times: {len(build_times.get('images', {}))} images")
    print(f"Overview data: {len(overview_data)} images")
    print(f"Specs data: {len(specs_data)} images")

    # Get all image directories
    if not IMAGES_DIR.exists():
        print(f"Error: {IMAGES_DIR} does not exist")
        sys.exit(1)

    image_dirs = [d for d in IMAGES_DIR.iterdir() if d.is_dir() and (d / "default.nix").exists()]
    print(f"Found {len(image_dirs)} image directories")

    readme_count = 0
    specs_count = 0

    for image_dir in sorted(image_dirs):
        image_name = image_dir.name

        # Generate README.md
        readme_content = generate_readme(image_name, build_times, overview_data)
        readme_path = image_dir / "README.md"
        with open(readme_path, 'w') as f:
            f.write(readme_content)
        readme_count += 1

        # Generate specifications.md
        specs_content = generate_specifications(image_name, specs_data)
        specs_path = image_dir / "specifications.md"
        with open(specs_path, 'w') as f:
            f.write(specs_content)
        specs_count += 1

    print(f"\nGenerated {readme_count} README.md files")
    print(f"Generated {specs_count} specifications.md files")


if __name__ == "__main__":
    main()
