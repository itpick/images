{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ratify-fips-crds
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ratify-fips-crds";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ratify-fips-crds";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ratify-fips-crds";
    homepage = "https://github.com/TODO/ratify-fips-crds";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
