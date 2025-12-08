{ buildCLIImage, fetchFromGitHub, buildDotnetModule, dotnetCorePackages, lib, ... }:

let
  version = "9.1.41";
  reflector = buildDotnetModule {
    pname = "reflector";
    inherit version;

    src = fetchFromGitHub {
      owner = "emberstack";
      repo = "kubernetes-reflector";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    projectFile = "src/ES.Kubernetes.Reflector/ES.Kubernetes.Reflector.csproj";
    nugetDeps = ./deps.nix;  # TODO: Generate with nuget-to-nix

    dotnet-sdk = dotnetCorePackages.sdk_8_0;
    dotnet-runtime = dotnetCorePackages.aspnetcore_8_0;

    meta = with lib; {
      description = "Kubernetes Reflector - mirror resources across namespaces";
      homepage = "https://github.com/emberstack/kubernetes-reflector";
      license = licenses.mit;
    };
  };

in
buildCLIImage {
  drv = reflector;
  name = "reflector";
  tag = "v${version}";
  entrypoint = [ "${reflector}/bin/ES.Kubernetes.Reflector" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Kubernetes Reflector";
    "org.opencontainers.image.description" = "Mirror ConfigMaps and Secrets across namespaces";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "reflector";
  };
}
