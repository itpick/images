{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openssh-server - OpenSSH SSH daemon (sshd)
# https://www.openssh.com/

let
  opensshPackages = with pkgs; [
    openssh
    bash
    coreutils
    cacert
    tzdata
  ];

  # mkDefaultUserEnv provides /etc/passwd + /etc/group (nonroot, uid 65532) and a
  # writable /tmp (1777) for the generated host key + pid file.
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # Minimal sshd config. The stub had no Cmd, so its pod kind-test fails with "no
  # command specified". Listen on 0.0.0.0:2222 (>1024 so the nonroot user can
  # bind; operators wanting :22 run as root / add NET_BIND_SERVICE), pid on the
  # writable /tmp. Baked at /etc/sshd_config (a top-level path so it can't clash
  # with any /etc/ssh/* the openssh package ships). Operators mount their own
  # config / authorized_keys.
  sshdConfig = pkgs.writeTextDir "etc/sshd_config" ''
    Port 2222
    ListenAddress 0.0.0.0
    PidFile /tmp/sshd.pid
    PermitRootLogin no
    PasswordAuthentication no
    Subsystem sftp internal-sftp
  '';

  # sshd needs a host key, but the image rootfs is read-only — generate one into
  # the writable /tmp on first start. sshd also refuses a PATH-relative launch
  # ("sshd requires execution with an absolute path"), so exec it by store path.
  # writeShellApplication runs shellcheck at build time, so the script is
  # validated by the image build itself.
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = [ pkgs.openssh pkgs.coreutils ];
    text = ''
      HOSTKEY="''${SSH_HOSTKEY:-/tmp/ssh_host_ed25519_key}"
      if [ ! -f "$HOSTKEY" ]; then
        ssh-keygen -t ed25519 -f "$HOSTKEY" -N "" -q
      fi
      chmod 600 "$HOSTKEY"
      exec ${pkgs.openssh}/bin/sshd -D -e -f /etc/sshd_config -h "$HOSTKEY" "$@"
    '';
  };

in nix2container.buildImage {
  name = "openssh-server";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.openssh.version;
  copyToRoot = [
    (buildEnv {
      name = "openssh-server-root";
      paths = base.basePackages ++ opensshPackages ++ [ userEnv sshdConfig entrypoint ];
    })
  ];
  config = nonRoot.defaultConfig // {
    # Generate a host key into writable /tmp (read-only rootfs), then run sshd in
    # the foreground (-D) listening on 0.0.0.0:2222.
    Entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
    Cmd = [ ];
    ExposedPorts = {
      "2222/tcp" = { };
    };
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath opensshPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "openssh server";
      "org.opencontainers.image.description" = "OpenSSH SSH daemon (sshd)";
      "org.opencontainers.image.version" = pkgs.openssh.version;
    };
  };
}
