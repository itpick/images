{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tigera-operator-1.40
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tigera-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tigera-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tigera-operator";
    homepage = "https://github.com/TODO/tigera-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
