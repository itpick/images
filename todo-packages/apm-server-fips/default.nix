{ lib, stdenv, fetchFromGitHub, ... }:

# Package: apm-server-fips-9.1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "apm-server-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "apm-server-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for apm-server-fips";
    homepage = "https://github.com/TODO/apm-server-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
