{ mkImage, pkgs, lib, ... }:

# Jenkins - CI/CD server
# https://www.jenkins.io/

mkImage {
  drv = pkgs.jenkins;
  name = "jenkins";
  tag = "v${pkgs.jenkins.version}";
  entrypoint = [ "${pkgs.openjdk21_headless}/bin/java" ];
  # Run headless, on the writable /tmp, bound to all interfaces so the kind-test
  # probe can reach the UI on :8080.
  cmd = [
    "-Djava.awt.headless=true"
    "-jar"
    "${pkgs.jenkins}/webapps/jenkins.war"
    "--httpPort=8080"
    "--httpListenAddress=0.0.0.0"
  ];

  extraPkgs = with pkgs; [ openjdk21_headless cacert git bash coreutils ];

  # Jenkins stores everything under JENKINS_HOME (default $user.home/.jenkins).
  # The image runs non-root with no /etc/passwd, so Java resolves user.home to
  # the read-only "/" and Jenkins fatally fails to create /.jenkins. Point
  # JENKINS_HOME (and HOME) at the writable /tmp mkImage provides. Operators
  # mount a volume there to persist jobs/config.
  env = {
    JENKINS_HOME = "/tmp/jenkins";
    HOME = "/tmp";
  };

  labels = {
    "org.opencontainers.image.title" = "Jenkins";
    "org.opencontainers.image.description" = "Open source automation server";
    "org.opencontainers.image.version" = pkgs.jenkins.version;
  };
}
