# Images to Build Configuration
# ==============================
# Edit this file to specify which images to build.
#
# Usage:
#   nix build .#selected-images          # Build images listed here
#   nix build .#infrastructure-images    # Build all infrastructure images
#   nix build .#all-images               # Build everything
#
# Format options:
#   - Exact names: "nginx", "postgres"
#   - Glob patterns: "nix-*", "*-operator"
#   - Categories: "@infrastructure", "@database", "@cli"
#
# Available categories:
#   @infrastructure - Operators, controllers, cluster tools
#   @database       - Database servers (postgres, redis, mongodb, etc.)
#   @web            - Web servers and proxies (nginx, caddy, haproxy)
#   @runtime        - Language runtimes (python, node, go, rust, jdk)
#   @cli            - CLI tools (kubectl, helm, cosign, grype)
#   @devops         - DevOps tools (docker-compose, dive, crane, ko)
#   @nix            - Nix ecosystem (nix, cachix, devenv, attic)
#   @build          - Build environments (cpp-build-env, gradle, maven)
#   @dev            - Development tools (devcontainer, pocket-id)

{
  # List of images to build (exact names, patterns, or categories)
  images = [
    # Examples of different selection methods:

    # Exact names
    "nginx"
    "postgres"

    # Glob patterns - select all nix-related images
    "nix-*"

    # Category - all CLI tools
    "@cli"
  ];

  # Exclude patterns (optional) - these are excluded even if matched above
  exclude = [
    # Example: exclude busybox from CLI tools
    # "busybox"
  ];
}
