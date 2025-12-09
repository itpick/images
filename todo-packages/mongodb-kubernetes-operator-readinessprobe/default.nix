{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mongodb-kubernetes-operator-readinessprobe
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mongodb-kubernetes-operator-readinessprobe";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mongodb-kubernetes-operator-readinessprobe";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mongodb-kubernetes-operator-readinessprobe";
    homepage = "https://github.com/TODO/mongodb-kubernetes-operator-readinessprobe";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
