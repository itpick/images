{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mongodb-kubernetes-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mongodb-kubernetes-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mongodb-kubernetes-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mongodb-kubernetes-operator";
    homepage = "https://github.com/TODO/mongodb-kubernetes-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
