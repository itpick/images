{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nsc-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nsc-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nsc-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nsc-fips";
    homepage = "https://github.com/TODO/nsc-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
