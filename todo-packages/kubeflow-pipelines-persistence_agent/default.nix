{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubeflow-pipelines-persistence_agent
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubeflow-pipelines-persistence_agent";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubeflow-pipelines-persistence_agent";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubeflow-pipelines-persistence_agent";
    homepage = "https://github.com/TODO/kubeflow-pipelines-persistence_agent";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
