{ lib, stdenv, fetchFromGitHub, ... }:

# Package: brotli-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "brotli-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "brotli-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for brotli-dev";
    homepage = "https://github.com/TODO/brotli-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
