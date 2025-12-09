{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubeflow-centraldashboard
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubeflow-centraldashboard";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubeflow-centraldashboard";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubeflow-centraldashboard";
    homepage = "https://github.com/TODO/kubeflow-centraldashboard";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
