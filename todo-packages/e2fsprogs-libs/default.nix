{ lib, stdenv, fetchFromGitHub, ... }:

# Package: e2fsprogs-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "e2fsprogs-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "e2fsprogs-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for e2fsprogs-libs";
    homepage = "https://github.com/TODO/e2fsprogs-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
