{ lib, stdenv, fetchFromGitHub, ... }:

# Package: hubble-ui-backend-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "hubble-ui-backend-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "hubble-ui-backend-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for hubble-ui-backend-fips";
    homepage = "https://github.com/TODO/hubble-ui-backend-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
