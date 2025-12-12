{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tritonserver-trtllm-backend
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "tritonserver-trtllm-backend";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "tritonserver-trtllm-backend-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tritonserver-trtllm-backend";
      "org.opencontainers.image.description" = "tritonserver-trtllm-backend container image";
    };
  };
}
