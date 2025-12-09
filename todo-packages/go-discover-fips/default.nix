{ lib, stdenv, fetchFromGitHub, ... }:

# Package: go-discover-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "go-discover-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "go-discover-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for go-discover-fips";
    homepage = "https://github.com/TODO/go-discover-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
