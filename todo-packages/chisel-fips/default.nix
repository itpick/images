{ lib, stdenv, fetchFromGitHub, ... }:

# Package: chisel-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "chisel-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "chisel-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for chisel-fips";
    homepage = "https://github.com/TODO/chisel-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
