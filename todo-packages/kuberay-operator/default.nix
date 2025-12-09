{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kuberay-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kuberay-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kuberay-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kuberay-operator";
    homepage = "https://github.com/TODO/kuberay-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
