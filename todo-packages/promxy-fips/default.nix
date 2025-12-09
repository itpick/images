{ lib, stdenv, fetchFromGitHub, ... }:

# Package: promxy-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "promxy-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "promxy-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for promxy-fips";
    homepage = "https://github.com/TODO/promxy-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
