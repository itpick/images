# playwright
# ==========
# Minimal Node.js + Chromium image for headless browser automation (Playwright).
#
# Provides Node.js 22, Chromium, fonts, and SSL certs in a Nix-built image
# with near-zero CVEs. Designed as a base image for Playwright-based apps.
#
# Chromium runs headless; no X11/Wayland needed.
# Consumers should pass --no-sandbox --disable-dev-shm-usage to Chromium.
#
# Upstream replacement for: mcr.microsoft.com/playwright

{ nix2container, pkgs, lib, nonRoot, ... }:

let
  # Fonts for proper screenshot rendering
  fontPkgs = with pkgs; [
    freefont_ttf
    liberation_ttf
    noto-fonts
    noto-fonts-emoji
  ];

  # Font config so Chromium can find fonts
  fontconfig = pkgs.makeFontsConf {
    fontDirectories = fontPkgs;
  };

  userDirs = pkgs.runCommand "playwright-dirs" {} ''
    mkdir -p $out/tmp
    mkdir -p $out/home/nonroot
    mkdir -p $out/app
  '';

in
nix2container.buildImage {
  name = "playwright";
  tag = "v${pkgs.chromium.version}";

  layers = [
    # System layer: Node.js + Chromium + fonts
    (nix2container.buildLayer {
      copyToRoot = [
        pkgs.nodejs_22
        pkgs.chromium
        pkgs.busybox
        pkgs.cacert
        userDirs
      ] ++ fontPkgs;
      perms = [
        {
          path = userDirs;
          regex = "/tmp";
          mode = "1777";
        }
      ];
    })
  ];

  config = {
    WorkingDir = "/app";
    Env = [
      "CHROMIUM_PATH=${pkgs.chromium}/bin/chromium"
      "PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1"
      "FONTCONFIG_FILE=${fontconfig}"
      "PATH=${pkgs.nodejs_22}/bin:${pkgs.chromium}/bin:${pkgs.busybox}/bin"
      "NODE_ENV=production"
      "SSL_CERT_FILE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
    ];
    Labels = {
      "org.opencontainers.image.title" = "playwright";
      "org.opencontainers.image.description" = "Minimal Node.js + Chromium image for headless browser automation";
      "org.opencontainers.image.version" = pkgs.chromium.version;
    };
  };
}
