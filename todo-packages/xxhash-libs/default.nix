{ lib, stdenv, fetchFromGitHub, ... }:

# Package: xxhash-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "xxhash-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "xxhash-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for xxhash-libs";
    homepage = "https://github.com/TODO/xxhash-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
