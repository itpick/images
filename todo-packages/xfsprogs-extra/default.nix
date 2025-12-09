{ lib, stdenv, fetchFromGitHub, ... }:

# Package: xfsprogs-extra
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "xfsprogs-extra";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "xfsprogs-extra";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for xfsprogs-extra";
    homepage = "https://github.com/TODO/xfsprogs-extra";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
