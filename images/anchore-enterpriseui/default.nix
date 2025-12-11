# anchore-enterpriseui
# =============
# Anchore Enterprise UI - Web interface for Anchore Enterprise
# https://anchore.com/
#
# The Anchore Enterprise UI provides a web-based management console
# for viewing scan results, managing policies, and compliance reporting.
#
# NOTE: This is a commercial product. Binaries are not publicly available.
# For deployment, you need to pull from Anchore's private registry
# with a valid license.
#
# This implementation provides a minimal placeholder that serves
# a static page indicating enterprise UI is required.

{ nix2container, pkgs, lib, ... }:

let
  version = "5.11.0";

  # Create a placeholder HTML page
  placeholderPage = pkgs.writeTextDir "var/www/index.html" ''
    <!DOCTYPE html>
    <html>
    <head>
      <title>Anchore Enterprise UI</title>
      <style>
        body { font-family: system-ui, sans-serif; max-width: 800px; margin: 50px auto; padding: 20px; }
        .notice { background: #fff3cd; border: 1px solid #ffc107; padding: 20px; border-radius: 8px; }
        h1 { color: #333; }
        code { background: #f4f4f4; padding: 2px 6px; border-radius: 4px; }
      </style>
    </head>
    <body>
      <h1>Anchore Enterprise UI</h1>
      <div class="notice">
        <p><strong>Enterprise License Required</strong></p>
        <p>The Anchore Enterprise UI requires a valid enterprise license.</p>
        <p>For open-source alternatives, consider:</p>
        <ul>
          <li><code>grype</code> - Vulnerability scanner CLI</li>
          <li><code>syft</code> - SBOM generator CLI</li>
        </ul>
        <p>Contact <a href="https://anchore.com">Anchore</a> for enterprise licensing.</p>
      </div>
    </body>
    </html>
  '';

  # Simple HTTP server script
  serverScript = pkgs.writeShellScriptBin "anchore-ui-server" ''
    #!/usr/bin/env bash
    cd /var/www
    exec ${pkgs.python3}/bin/python -m http.server ''${PORT:-8080}
  '';

in
nix2container.buildImage {
  name = "anchore-enterpriseui";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "anchore-enterpriseui-root";
    paths = [
      serverScript
      placeholderPage

      # Python for simple HTTP server
      pkgs.python3

      # Runtime utilities
      pkgs.bash
      pkgs.busybox
      pkgs.coreutils

      # SSL/TLS
      pkgs.cacert

      # Create directories
      (pkgs.runCommand "anchoreui-dirs" {} ''
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/var" "/tmp" ];
  };

  config = {
    entrypoint = [ "${serverScript}/bin/anchore-ui-server" ];
    cmd = [];
    workingDir = "/var/www";
    exposedPorts = {
      "8080/tcp" = {};
    };
    env = [
      "PORT=8080"
    ];
    labels = {
      "org.opencontainers.image.title" = "Anchore Enterprise UI";
      "org.opencontainers.image.description" = "Web interface for Anchore Enterprise (placeholder)";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.note" = "Placeholder - enterprise license required for full UI";
    };
  };
}
