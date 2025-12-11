{ mkImage, pkgs, lib, ... }:

# trufflehog - Find leaked credentials
# https://github.com/trufflesecurity/trufflehog

mkImage {
  drv = pkgs.trufflehog;
  name = "trufflehog";
  tag = "v${pkgs.trufflehog.version}";
  entrypoint = [ "${pkgs.trufflehog}/bin/trufflehog" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "trufflehog";
    "org.opencontainers.image.description" = "Find leaked credentials in git repos, filesystems, and S3 buckets";
    "org.opencontainers.image.version" = pkgs.trufflehog.version;
  };
}
