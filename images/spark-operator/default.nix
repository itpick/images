{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "2.4.0";
  spark-operator = buildGoModule {
    pname = "spark-operator";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubeflow";
      repo = "spark-operator";
      rev = "v${version}";
      hash = "sha256-vQyOFREDwHjR6fh5puiQzcY5F0R6//ZXM6OQlRjQX8s=";
    };

    proxyVendor = true;
    vendorHash = "sha256-gIofPv24TFb5SBGEUd2JctYaUcpBiryw6oBpCjZyYAI=";

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes operator for managing Apache Spark applications";
      homepage = "https://github.com/kubeflow/spark-operator";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = spark-operator;
  name = "spark-operator";
  tag = "v${version}";
  entrypoint = [ "${spark-operator}/bin/spark-operator" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Spark Operator";
    "org.opencontainers.image.description" = "Kubernetes operator for Apache Spark";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "spark-operator";
  };
}
