{ lib, stdenv, fetchFromGitHub, ... }:

# Package: caddy-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "caddy-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "caddy-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for caddy-fips";
    homepage = "https://github.com/TODO/caddy-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
