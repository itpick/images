{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-memcached
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-memcached";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-memcached";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-memcached";
    homepage = "https://github.com/TODO/nri-memcached";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
