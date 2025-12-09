{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubeflow-pipelines-metadata-writer
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubeflow-pipelines-metadata-writer";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubeflow-pipelines-metadata-writer";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubeflow-pipelines-metadata-writer";
    homepage = "https://github.com/TODO/kubeflow-pipelines-metadata-writer";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
