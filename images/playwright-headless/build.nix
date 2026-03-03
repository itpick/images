# playwright/build.nix
# ===================
# Shared builder for Playwright container images.
#
# Two variants:
#   playwright          — headless shell only (~850MB), for CI/screenshot automation
#   playwright-headed   — full Chromium + headless shell (~1.7GB), for headed/debug use
#
# Both use Playwright's own Chromium builds (via playwright-driver) instead of
# the full desktop pkgs.chromium, avoiding GTK/pipewire/systemd bloat.
#
# Consumers should pass --no-sandbox --disable-dev-shm-usage to Chromium.

{ nix2container, pkgs, nonRoot, headed ? false }:

let
  # Copy only the browsers we need from playwright-driver.browsers.
  # Using cp -r (not symlinks) breaks the Nix closure graph so we don't
  # pull in firefox/webkit/unused browsers.
  playwrightBrowsers = pkgs.runCommand
    "playwright-browsers-${if headed then "full" else "headless"}" {} ''
    mkdir -p $out
    ${if headed then ''
      cp -r ${pkgs.playwright-driver.browsers}/chromium-* $out/
    '' else ""}
    cp -r ${pkgs.playwright-driver.browsers}/chromium_headless_shell-* $out/
    cp -r ${pkgs.playwright-driver.browsers}/ffmpeg-* $out/
  '';

  variant = if headed then "headed" else "headless";
  imageName = if headed then "playwright-headed" else "playwright-headless";

  # Fonts for proper screenshot rendering
  fontPkgs = with pkgs; [
    freefont_ttf
    liberation_ttf
    noto-fonts
    noto-fonts-color-emoji
  ];

  fontconfig = pkgs.makeFontsConf {
    fontDirectories = fontPkgs;
  };

  # User environment with /etc/passwd, /etc/group, home dir, /tmp
  baseUserEnv = nonRoot.mkDefaultUserEnv pkgs [ "/app" ];

  # Extend with nsswitch.conf (Chromium needs getpwuid/name resolution)
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
  name = imageName;
  tag = "v${pkgs.playwright-driver.version}";

  layers = [
    # User environment layer
    (nix2container.buildLayer {
      copyToRoot = [ userEnv ];
      perms = [
        { path = userEnv; regex = "/tmp"; mode = "1777"; }
        { path = userEnv; regex = "/home/nonroot"; mode = "0755"; uid = 65532; gid = 65532; }
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

    # Playwright browsers + fonts layer
    (nix2container.buildLayer {
      copyToRoot = [ playwrightBrowsers ] ++ fontPkgs;
    })
  ];

  config = {
    WorkingDir = "/app";
    Env = [
      "HOME=/home/nonroot"
      "PLAYWRIGHT_BROWSERS_PATH=${playwrightBrowsers}"
      "PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1"
      "FONTCONFIG_FILE=${fontconfig}"
      "PATH=${pkgs.nodejs_22}/bin:${pkgs.busybox}/bin"
      "NODE_ENV=production"
      "SSL_CERT_FILE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
    ];
    Labels = {
      "org.opencontainers.image.title" = imageName;
      "org.opencontainers.image.description" = "Node.js + Chromium (${variant}) for Playwright automation";
      "org.opencontainers.image.version" = pkgs.playwright-driver.version;
    };
  };
}
