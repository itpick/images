{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubeflow-notebook-controller-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubeflow-notebook-controller-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubeflow-notebook-controller-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubeflow-notebook-controller-fips";
    homepage = "https://github.com/TODO/kubeflow-notebook-controller-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
