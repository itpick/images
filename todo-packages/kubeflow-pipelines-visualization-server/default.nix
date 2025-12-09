{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubeflow-pipelines-visualization-server
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubeflow-pipelines-visualization-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubeflow-pipelines-visualization-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubeflow-pipelines-visualization-server";
    homepage = "https://github.com/TODO/kubeflow-pipelines-visualization-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
