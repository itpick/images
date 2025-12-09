{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gatekeeper-fips-3.21
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gatekeeper-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gatekeeper-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gatekeeper-fips";
    homepage = "https://github.com/TODO/gatekeeper-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
