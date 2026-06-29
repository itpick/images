{ mkImage, pkgs, lib, ... }:

# OpenVSCode Server - VS Code in the browser
# https://github.com/gitpod-io/openvscode-server

let
  # /etc/passwd entry for the running uid (65532). openvscode-server is a Node
  # app and calls os.userInfo()/getpwuid at startup, which throws if the uid
  # isn't in passwd — and mkImage ships none. Passwd-only derivation (just /etc)
  # to avoid colliding with mkImage's writable /tmp layer; HOME=/tmp so the
  # server's user-data/extensions state lands somewhere writable. (Same recipe
  # as images/code-server.)
  passwdEnv = pkgs.runCommand "openvscode-server-passwd" {} ''
    mkdir -p $out/etc
    printf 'root:x:0:0:root:/root:/sbin/nologin\nnonroot:x:65532:65532:nonroot:/tmp:/sbin/nologin\n' > $out/etc/passwd
    printf 'root:x:0:\nnonroot:x:65532:\n' > $out/etc/group
  '';

in
mkImage {
  drv = pkgs.openvscode-server;
  name = "openvscode-server";
  tag = "v${pkgs.openvscode-server.version}";
  entrypoint = [ "${pkgs.openvscode-server}/bin/openvscode-server" ];
  # Was `--help` (a one-shot). Run the server bound to all interfaces with the
  # connection token disabled (smoke-test friendly; operators drop
  # --without-connection-token / set a token), with server state under the
  # writable /tmp mkImage provides.
  cmd = [
    "--host" "0.0.0.0"
    "--port" "3000"
    "--without-connection-token"
    "--server-data-dir" "/tmp/openvscode-server"
  ];
  env = {
    HOME = "/tmp";
  };

  extraPkgs = [ pkgs.cacert passwdEnv ];

  labels = {
    "org.opencontainers.image.title" = "OpenVSCode Server";
    "org.opencontainers.image.description" = "VS Code in the browser";
    "org.opencontainers.image.version" = pkgs.openvscode-server.version;
    "io.nix-containers.image.upstream" = "https://github.com/gitpod-io/openvscode-server";
    "io.nix-containers.image.category" = "web-service";
    "io.nix-containers.image.aliases" = "openvscode-server,vscode,ide";
  };
}
