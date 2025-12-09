#!/usr/bin/env python3
"""
Wolfi YAML to Nix Expression Converter

This script converts Wolfi/melange package YAML definitions to Nix expressions.
It extracts source information, build steps, and dependencies from the YAML
and generates equivalent Nix derivations.

Usage:
    python convert.py <package-name> [--output <path>]
    python convert.py keda-2.18 --output pkgs/keda/default.nix
"""

import argparse
import json
import re
import sys
import urllib.request
from pathlib import Path

try:
    import yaml
except ImportError:
    print("PyYAML not found. Install with: pip install pyyaml")
    sys.exit(1)

WOLFI_RAW_URL = "https://raw.githubusercontent.com/wolfi-dev/os/main"
WOLFI_LOCAL_PATH = Path.home() / "workspace/drduker/nix-containers/os"


def fetch_yaml(package_name: str) -> dict:
    """Fetch and parse a Wolfi package YAML from local repo, file path, or GitHub."""
    # Check if it's a local file path
    if Path(package_name).exists():
        with open(package_name) as f:
            return yaml.safe_load(f)

    # Check local wolfi-dev/os clone
    local_yaml = WOLFI_LOCAL_PATH / f"{package_name}.yaml"
    if local_yaml.exists():
        print(f"Using local: {local_yaml}")
        with open(local_yaml) as f:
            return yaml.safe_load(f)

    url = f"{WOLFI_RAW_URL}/{package_name}.yaml"

    # Try curl first (more reliable on macOS)
    import subprocess
    try:
        result = subprocess.run(
            ["curl", "-sL", url],
            capture_output=True,
            text=True,
            check=True
        )
        return yaml.safe_load(result.stdout)
    except subprocess.CalledProcessError:
        pass

    # Fall back to urllib
    try:
        import ssl
        context = ssl.create_default_context()
        context.check_hostname = False
        context.verify_mode = ssl.CERT_NONE
        with urllib.request.urlopen(url, context=context) as response:
            return yaml.safe_load(response.read())
    except Exception as e:
        print(f"Error fetching {url}: {e}")
        sys.exit(1)


def extract_git_info(pipeline: list) -> dict:
    """Extract git repository info from pipeline steps."""
    for step in pipeline:
        if step.get("uses") == "git-checkout":
            with_data = step.get("with", {})
            return {
                "repository": with_data.get("repository", ""),
                "tag": with_data.get("tag", ""),
                "commit": with_data.get("expected-commit", ""),
            }
    return {}


def extract_fetch_info(pipeline: list) -> dict:
    """Extract fetch URL info from pipeline steps."""
    for step in pipeline:
        if step.get("uses") == "fetch":
            with_data = step.get("with", {})
            return {
                "uri": with_data.get("uri", ""),
                "expected-sha256": with_data.get("expected-sha256", ""),
                "expected-sha512": with_data.get("expected-sha512", ""),
            }
    return {}


def extract_build_commands(pipeline: list) -> list:
    """Extract shell commands from pipeline runs steps."""
    commands = []
    for step in pipeline:
        if "runs" in step:
            commands.append(step["runs"].strip())
    return commands


def wolfi_pkg_to_nix(pkg_name: str) -> str:
    """Map Wolfi package names to nixpkgs equivalents."""
    mapping = {
        "go": "go",
        "build-base": "stdenv.cc",
        "busybox": "busybox",
        "ca-certificates-bundle": "cacert",
        "protobuf-dev": "protobuf",
        "protoc": "protobuf",
        "git": "git",
        "curl": "curl",
        "bash": "bash",
        "coreutils": "coreutils",
        "openssl-dev": "openssl",
        "zlib-dev": "zlib",
        "cmake": "cmake",
        "make": "gnumake",
        "nodejs": "nodejs",
        "python3": "python3",
        "rust": "rustc",
        "cargo": "cargo",
    }
    return mapping.get(pkg_name, f"# Unknown: {pkg_name}")


def detect_builder(yaml_data: dict) -> str:
    """Detect which Nix builder to use based on package contents."""
    pkg_name = yaml_data.get("package", {}).get("name", "").lower()
    env_packages = yaml_data.get("environment", {}).get("contents", {}).get("packages", [])

    # Check for Go
    if "go" in env_packages or "golang" in env_packages:
        return "buildGoModule"

    # Check for Rust
    if "rust" in env_packages or "cargo" in env_packages:
        return "rustPlatform.buildRustPackage"

    # Check for Python
    if "python3" in env_packages:
        return "python3Packages.buildPythonPackage"

    # Check for Node
    if "nodejs" in env_packages:
        return "buildNpmPackage"

    # Default to stdenv
    return "stdenv.mkDerivation"


def generate_nix_expression(yaml_data: dict) -> str:
    """Generate a Nix expression from parsed Wolfi YAML."""
    pkg = yaml_data.get("package", {})
    pipeline = yaml_data.get("pipeline", [])
    env = yaml_data.get("environment", {})
    deps = yaml_data.get("dependencies", {})

    name = pkg.get("name", "unknown")
    version = pkg.get("version", "0.0.0")
    description = pkg.get("description", "")
    license_info = pkg.get("copyright", [{}])[0].get("license", "Unknown")

    # Extract source info
    git_info = extract_git_info(pipeline)
    fetch_info = extract_fetch_info(pipeline)
    build_commands = extract_build_commands(pipeline)

    # Detect builder type
    builder = detect_builder(yaml_data)

    # Map environment packages to nix
    env_packages = env.get("contents", {}).get("packages", [])
    nix_build_inputs = [wolfi_pkg_to_nix(p) for p in env_packages]

    # Map runtime dependencies
    runtime_deps = deps.get("runtime", [])
    nix_runtime = [wolfi_pkg_to_nix(p) for p in runtime_deps if isinstance(p, str)]

    # Clean up name for Nix (remove version suffix)
    pname = re.sub(r'-\d+\.\d+$', '', name)

    # Generate based on builder type
    if builder == "buildGoModule":
        return generate_go_module(pname, version, description, license_info,
                                   git_info, build_commands, nix_build_inputs, nix_runtime)
    else:
        return generate_stdenv(pname, version, description, license_info,
                               git_info, fetch_info, build_commands, nix_build_inputs, nix_runtime)


def generate_go_module(pname, version, description, license_info,
                       git_info, build_commands, build_inputs, runtime_deps) -> str:
    """Generate a buildGoModule expression."""

    # Parse repository info
    repo_url = git_info.get("repository", "")
    repo_match = re.match(r"https://github.com/([^/]+)/([^/]+)", repo_url)
    owner = repo_match.group(1) if repo_match else "OWNER"
    repo = repo_match.group(2) if repo_match else "REPO"

    tag = git_info.get("tag", f"v{version}")
    commit = git_info.get("commit", "")

    # Extract subPackages from build commands
    sub_packages = "[ \".\" ]"  # Default
    for cmd in build_commands:
        if "make build" in cmd.lower():
            sub_packages = "# Detected make build - adjust subPackages as needed"

    nix = f'''{{ buildGoModule, fetchFromGitHub, lib, ... }}:

# Auto-generated from wolfi-dev/os {pname}.yaml
# Review and adjust as needed

buildGoModule rec {{
  pname = "{pname}";
  version = "{version}";

  src = fetchFromGitHub {{
    owner = "{owner}";
    repo = "{repo}";
    rev = "{tag.replace("${{package.version}}", "${version}")}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Update after first build
  }};

  vendorHash = null;  # TODO: Update or set to null if vendor/ is included

  # ldflags - common for Go projects
  ldflags = [
    "-s" "-w"
    "-X main.version=${{version}}"
  ];

  # Build-time dependencies
  nativeBuildInputs = [
    {chr(10).join(f"    # {inp}" for inp in build_inputs if not inp.startswith("#"))}
  ];

  subPackages = {sub_packages};

  doCheck = false;  # Disable tests during initial build

  meta = with lib; {{
    description = "{description}";
    homepage = "{repo_url}";
    license = licenses.{license_to_nix(license_info)};
    maintainers = with maintainers; [ ];
  }};
}}
'''
    return nix


def generate_stdenv(pname, version, description, license_info,
                    git_info, fetch_info, build_commands, build_inputs, runtime_deps) -> str:
    """Generate a stdenv.mkDerivation expression."""

    # Determine source type
    if git_info.get("repository"):
        repo_url = git_info.get("repository", "")
        repo_match = re.match(r"https://github.com/([^/]+)/([^/]+)", repo_url)
        owner = repo_match.group(1) if repo_match else "OWNER"
        repo = repo_match.group(2) if repo_match else "REPO"
        tag = git_info.get("tag", f"v{version}")

        src_block = f'''  src = fetchFromGitHub {{
    owner = "{owner}";
    repo = "{repo}";
    rev = "{tag.replace("${{package.version}}", "${version}")}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Update
  }};'''
    elif fetch_info.get("uri"):
        uri = fetch_info.get("uri", "")
        src_block = f'''  src = fetchurl {{
    url = "{uri.replace("${{package.version}}", "${version}")}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Update
  }};'''
    else:
        src_block = "  src = null;  # TODO: Add source"

    # Format build commands
    build_phase = "\\n".join(build_commands) if build_commands else "make"

    nix = f'''{{ stdenv, lib, fetchFromGitHub, fetchurl, ... }}:

# Auto-generated from wolfi-dev/os {pname}.yaml
# Review and adjust as needed

stdenv.mkDerivation rec {{
  pname = "{pname}";
  version = "{version}";

{src_block}

  nativeBuildInputs = [
    {chr(10).join(f"    # {inp}" for inp in build_inputs if not inp.startswith("#"))}
  ];

  buildPhase = \'\'
    {build_phase}
  \'\';

  installPhase = \'\'
    mkdir -p $out/bin
    # TODO: Add install commands
  \'\';

  meta = with lib; {{
    description = "{description}";
    homepage = "";
    license = licenses.{license_to_nix(license_info)};
    maintainers = with maintainers; [ ];
  }};
}}
'''
    return nix


def license_to_nix(license_str: str) -> str:
    """Convert SPDX license identifier to nixpkgs license."""
    mapping = {
        "Apache-2.0": "asl20",
        "MIT": "mit",
        "GPL-2.0": "gpl2Only",
        "GPL-2.0-only": "gpl2Only",
        "GPL-3.0": "gpl3Only",
        "GPL-3.0-only": "gpl3Only",
        "BSD-2-Clause": "bsd2",
        "BSD-3-Clause": "bsd3",
        "ISC": "isc",
        "MPL-2.0": "mpl20",
        "LGPL-2.1": "lgpl21Only",
        "LGPL-3.0": "lgpl3Only",
    }
    return mapping.get(license_str, "unfree  # TODO: Fix license")


def main():
    parser = argparse.ArgumentParser(description="Convert Wolfi YAML to Nix expression")
    parser.add_argument("package", help="Package name (e.g., keda-2.18)")
    parser.add_argument("--output", "-o", help="Output file path")
    parser.add_argument("--json", action="store_true", help="Output parsed YAML as JSON")
    args = parser.parse_args()

    print(f"Fetching {args.package}.yaml from wolfi-dev/os...")
    yaml_data = fetch_yaml(args.package)

    if args.json:
        print(json.dumps(yaml_data, indent=2))
        return

    print("Generating Nix expression...")
    nix_expr = generate_nix_expression(yaml_data)

    if args.output:
        output_path = Path(args.output)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(nix_expr)
        print(f"Written to {args.output}")
    else:
        print("\n" + "=" * 60)
        print(nix_expr)


if __name__ == "__main__":
    main()
