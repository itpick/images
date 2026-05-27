{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-fips
# Nginx web server. Drop-in for distros that mount nginx.conf and certs as
# read-only volumes and use a small entrypoint shim (sed-substitute the DNS
# resolver, write the result, exec nginx). The shim writes to /tmp by
# convention, so /tmp has to be a real, writable directory in this image
# instead of a symlink to the read-only nix-store userEnv.

let
  nginxPkgs = with pkgs; [
    nginx
    bash
    coreutils
    gnused
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

  # mkDefaultUserEnv adds /tmp as a real dir, but when buildEnv merges it
  # the path becomes a SYMLINK back to the nix-store userEnv. The store is
  # read-only, so any caller's `sed > /tmp/foo` fails. Strip /tmp from the
  # userEnv copy so tmpDir below is the only contributor for that path.
  userEnvSansTmp = pkgs.runCommand "nginx-user-env-no-tmp" {} ''
    mkdir -p $out
    cp -rL ${userEnv}/. $out/
    chmod -R u+w $out
    rm -rf $out/tmp
  '';

  # Real /tmp baked outside buildEnv so it stays a directory, not a symlink.
  # Mode 1777 (sticky) matches the convention.
  tmpDir = pkgs.runCommand "nginx-fips-tmp" {} ''
    mkdir -p $out/tmp
    chmod 1777 $out/tmp
  '';

in nix2container.buildImage {
  name = "nginx-fips";
  tag = pkgs.nginx.version;

  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "nginx-fips-root";
          paths = base.basePackages ++ nginxPkgs ++ [ userEnvSansTmp ];
        })
        tmpDir
      ];
      perms = [
        {
          path = tmpDir;
          regex = "/tmp";
          mode = "1777";
        }
      ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Entrypoint = [ "${pkgs.nginx}/bin/nginx" ];
    Cmd = [ "-g" "daemon off;" ];
    ExposedPorts = { "80/tcp" = {}; "443/tcp" = {}; };
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "nginx-fips";
      "org.opencontainers.image.description" = "Nginx web server (FIPS-intent build), nonroot, with writable /tmp";
      "org.opencontainers.image.version" = pkgs.nginx.version;
      "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
