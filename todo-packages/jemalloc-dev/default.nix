{ lib, stdenv, fetchFromGitHub, ... }:

# Package: jemalloc-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "jemalloc-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "jemalloc-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for jemalloc-dev";
    homepage = "https://github.com/TODO/jemalloc-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
