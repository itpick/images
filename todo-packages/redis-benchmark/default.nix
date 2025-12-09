{ lib, stdenv, fetchFromGitHub, ... }:

# Package: redis-benchmark-8.4
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "redis-benchmark";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "redis-benchmark";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for redis-benchmark";
    homepage = "https://github.com/TODO/redis-benchmark";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
