{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubeflow-pipelines-metadata-envoy-config
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubeflow-pipelines-metadata-envoy-config";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubeflow-pipelines-metadata-envoy-config";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubeflow-pipelines-metadata-envoy-config";
    homepage = "https://github.com/TODO/kubeflow-pipelines-metadata-envoy-config";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
