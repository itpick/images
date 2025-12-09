{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-redis
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-redis";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-redis";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-redis";
    homepage = "https://github.com/TODO/nri-redis";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
