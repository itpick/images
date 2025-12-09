{ lib, stdenv, fetchFromGitHub, ... }:

# Package: k8ssandra-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "k8ssandra-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "k8ssandra-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for k8ssandra-operator";
    homepage = "https://github.com/TODO/k8ssandra-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
