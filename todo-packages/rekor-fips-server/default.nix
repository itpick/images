{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rekor-fips-server
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rekor-fips-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rekor-fips-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rekor-fips-server";
    homepage = "https://github.com/TODO/rekor-fips-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
