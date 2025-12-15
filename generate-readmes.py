#!/usr/bin/env python3
"""
Generate README.md files for images that don't have them.
Uses overview data from data-gathering folder.
"""

import os
import json
import re

DATA_FILE = "data-gathering/chainguard-overview-data.json"
IMAGES_DIR = "images"

def extract_description(raw_text):
    """Extract the main description from the raw overview text."""
    if not raw_text:
        return None

    # Look for "Chainguard Container for X" pattern and get the description after it
    match = re.search(r'Chainguard Container for [\w\-]+\n\n([^\n]+)', raw_text)
    if match:
        desc = match.group(1).strip()
        # Clean up the description
        if desc and not desc.startswith('Chainguard') and len(desc) > 10:
            return desc

    # Alternative: look for description after the title
    lines = raw_text.split('\n')
    for i, line in enumerate(lines):
        if 'Chainguard Container for' in line and i + 2 < len(lines):
            desc = lines[i + 2].strip() if lines[i + 1].strip() == '' else lines[i + 1].strip()
            if desc and not desc.startswith('Chainguard') and len(desc) > 10:
                return desc

    return None

def generate_readme(image_name, description=None):
    """Generate README content for an image."""
    content = f"# {image_name}\n\n"

    if description:
        content += f"{description}\n\n"

    content += """## Usage

```bash
# Build the image
nix build .#""" + image_name + """

# Load into Docker
nix build .#load-""" + image_name + """-to-docker && ./result/bin/load-""" + image_name + """-to-docker
```
"""
    return content

def main():
    # Load overview data
    try:
        with open(DATA_FILE, 'r') as f:
            overview_data = json.load(f)
        print(f"Loaded {len(overview_data)} image overviews")
    except Exception as e:
        print(f"Warning: Could not load overview data: {e}")
        overview_data = {}

    created = 0
    skipped = 0
    no_folder = 0

    # Get all image directories
    image_dirs = []
    for entry in os.listdir(IMAGES_DIR):
        dir_path = os.path.join(IMAGES_DIR, entry)
        if os.path.isdir(dir_path) and os.path.exists(os.path.join(dir_path, "default.nix")):
            image_dirs.append(entry)

    print(f"Found {len(image_dirs)} image directories")

    for image_name in sorted(image_dirs):
        dir_path = os.path.join(IMAGES_DIR, image_name)
        readme_path = os.path.join(dir_path, "README.md")

        # Skip if README already exists
        if os.path.exists(readme_path):
            skipped += 1
            continue

        # Get description from overview data
        description = None
        if image_name in overview_data:
            raw_text = overview_data[image_name].get('rawText', '')
            description = extract_description(raw_text)

        # Generate and write README
        readme_content = generate_readme(image_name, description)

        with open(readme_path, 'w') as f:
            f.write(readme_content)

        created += 1
        if created <= 20 or created % 100 == 0:
            print(f"Created: {readme_path}" + (f" - {description[:50]}..." if description else ""))

    print(f"\nSummary:")
    print(f"  Created: {created}")
    print(f"  Skipped (already exists): {skipped}")

if __name__ == "__main__":
    main()
