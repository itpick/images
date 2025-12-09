{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubeflow-tensorboard-controller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubeflow-tensorboard-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubeflow-tensorboard-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubeflow-tensorboard-controller";
    homepage = "https://github.com/TODO/kubeflow-tensorboard-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
