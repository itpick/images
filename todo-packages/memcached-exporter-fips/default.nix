{ lib, stdenv, fetchFromGitHub, ... }:

# Package: memcached-exporter-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "memcached-exporter-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "memcached-exporter-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for memcached-exporter-fips";
    homepage = "https://github.com/TODO/memcached-exporter-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
