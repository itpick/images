{ mkImage, pkgs, lib, ... }:

# zipkin-slim
# Container image packaging nixpkgs.zipkin
mkImage {
  drv = pkgs.zipkin;
  name = "zipkin-slim";
  tag = "v${pkgs.zipkin.version}";
  entrypoint = [ (lib.getExe pkgs.zipkin) ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Zipkin's server
  # starts with NO arguments (in-memory storage, no config), binding
  # 0.0.0.0:9411 — so run it with an empty cmd. Operators point STORAGE_TYPE /
  # env at a real backend.
  cmd = [ ];

  # nixpkgs wraps this old Zipkin (Spring Boot 1.5) with a JDK 21, but Boot 1.5's
  # cglib does reflective defineClass on java.lang, which JPMS blocks by default
  # ("module java.base does not open java.lang") — the server dies at startup.
  # Re-open the packages the old runtime needs via JAVA_TOOL_OPTIONS (the JVM
  # reads it for extra flags; the wrapper passes cmd args to Spring Boot, not the
  # JVM, so they can't go there). HOME on the writable /tmp keeps any JVM prefs
  # write off the read-only rootfs.
  env = {
    JAVA_TOOL_OPTIONS = "--add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.lang.reflect=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED";
    HOME = "/tmp";
  };

  labels = {
    "org.opencontainers.image.title" = "zipkin-slim";
    "org.opencontainers.image.description" = "zipkin-slim container image (nixpkgs.zipkin)";
    "org.opencontainers.image.version" = pkgs.zipkin.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
