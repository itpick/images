{ mkImage, pkgs, lib, ... }:

# Jenkins - CI/CD server
# https://www.jenkins.io/

mkImage {
  drv = pkgs.jenkins;
  name = "jenkins";
  tag = "v${pkgs.jenkins.version}";
  entrypoint = [ "${pkgs.openjdk21_headless}/bin/java" ];
  cmd = [ "-jar" "${pkgs.jenkins}/webapps/jenkins.war" ];

  extraPkgs = with pkgs; [ openjdk21_headless cacert git bash coreutils ];

  labels = {
    "org.opencontainers.image.title" = "Jenkins";
    "org.opencontainers.image.description" = "Open source automation server";
    "org.opencontainers.image.version" = pkgs.jenkins.version;
  };
}
