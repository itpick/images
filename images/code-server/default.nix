{ mkImage, pkgs, nonRoot, ... }:

# code-server - VS Code in the browser
# https://github.com/coder/code-server

let
  # /etc/passwd entry for the running uid (65532). code-server is a Node app and
  # calls os.userInfo()/getpwuid at startup, which throws if the uid isn't in
  # passwd — and mkImage ships none. Passwd-only derivation (just /etc) to avoid
  # colliding with mkImage's own writable /tmp layer. HOME points at writable
  # /tmp so XDG config/state land somewhere writable.
  passwdEnv = pkgs.runCommand "code-server-passwd" {} ''
    mkdir -p $out/etc
    printf 'root:x:0:0:root:/root:/sbin/nologin\nnonroot:x:65532:65532:nonroot:/tmp:/sbin/nologin\n' > $out/etc/passwd
    printf 'root:x:0:\nnonroot:x:65532:\n' > $out/etc/group
  '';

in
mkImage {
  drv = pkgs.code-server;
  name = "code-server";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.code-server.version;

  # The stub ran `code-server --help` (a one-shot). Run the server bound to all
  # interfaces with auth disabled (smoke-test friendly; operators set
  # --auth password / PASSWORD), with user-data + extensions dirs under the
  # writable /tmp mkImage provides.
  entrypoint = [ "code-server" ];
  cmd = [
    "--bind-addr" "0.0.0.0:8080"
    "--auth" "none"
    "--disable-telemetry"
    "--user-data-dir" "/tmp/code-server/data"
    "--extensions-dir" "/tmp/code-server/extensions"
  ];
  extraContents = [ passwdEnv ];
  env = {
    HOME = "/tmp";
  };

  labels = {
    "org.opencontainers.image.title" = "code-server";
    "org.opencontainers.image.description" = "VS Code in the browser";
    "org.opencontainers.image.version" = pkgs.code-server.version;
    "io.nix-containers.image.upstream" = "https://github.com/coder/code-server";
    "io.nix-containers.image.category" = "web-service";
    "io.nix-containers.image.aliases" = "code-server,vscode,ide";
  };

  user = nonRoot.userString;
}
