{ lib, stdenv, fetchFromGitHub, ... }:

# Package: e2fsprogs-extra
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "e2fsprogs-extra";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "e2fsprogs-extra";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for e2fsprogs-extra";
    homepage = "https://github.com/TODO/e2fsprogs-extra";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
