{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubeflow-jupyter-web-app
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubeflow-jupyter-web-app";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubeflow-jupyter-web-app";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubeflow-jupyter-web-app";
    homepage = "https://github.com/TODO/kubeflow-jupyter-web-app";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
