{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-memcached-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-memcached-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-memcached-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-memcached-fips";
    homepage = "https://github.com/TODO/nri-memcached-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
