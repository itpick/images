{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libbrotlidec1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libbrotlidec1";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libbrotlidec1";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libbrotlidec1";
    homepage = "https://github.com/TODO/libbrotlidec1";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
