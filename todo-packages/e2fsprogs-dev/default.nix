{ lib, stdenv, fetchFromGitHub, ... }:

# Package: e2fsprogs-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "e2fsprogs-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "e2fsprogs-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for e2fsprogs-dev";
    homepage = "https://github.com/TODO/e2fsprogs-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
