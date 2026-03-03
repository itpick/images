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
    noto-fonts-color-emoji
  ];

  # Font config so Chromium can find fonts
  fontconfig = pkgs.makeFontsConf {
    fontDirectories = fontPkgs;
  };

  # User environment with /etc/passwd, /etc/group, /etc/nsswitch.conf, home dir, /tmp
  baseUserEnv = nonRoot.mkDefaultUserEnv pkgs [ "/app" ];

  # Extend user env with nsswitch.conf (Chromium needs getpwuid/name resolution)
  userEnv = pkgs.runCommand "playwright-user-env" {} ''
    cp -r ${baseUserEnv} $out
    chmod -R u+w $out
    cat > $out/etc/nsswitch.conf <<'NSSWITCH'
    passwd: files
    group: files
    hosts: files dns
    NSSWITCH
  '';

in
nix2container.buildImage {
  name = "playwright";
  tag = "v${pkgs.chromium.version}";

  layers = [
    # User environment layer (/etc/passwd, /etc/group, /etc/nsswitch.conf, /tmp, /home)
    (nix2container.buildLayer {
      copyToRoot = [ userEnv ];
      perms = [
        {
          path = userEnv;
          regex = "/tmp";
          mode = "1777";
        }
      ];
    })

    # Node.js + system tools layer
    (nix2container.buildLayer {
      copyToRoot = [
        pkgs.nodejs_22
        pkgs.busybox
        pkgs.cacert
      ];
    })

    # Chromium + fonts layer (separate to avoid /share/man conflict with Node.js)
    (nix2container.buildLayer {
      copyToRoot = [
        pkgs.chromium
      ] ++ fontPkgs;
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
