{ lib, stdenv, fetchFromGitHub, ... }:

# Package: hubble-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "hubble-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "hubble-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for hubble-fips";
    homepage = "https://github.com/TODO/hubble-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
