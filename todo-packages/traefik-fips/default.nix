{ lib, stdenv, fetchFromGitHub, ... }:

# Package: traefik-fips-3.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "traefik-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "traefik-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for traefik-fips";
    homepage = "https://github.com/TODO/traefik-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
