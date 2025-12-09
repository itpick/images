{ lib, stdenv, fetchFromGitHub, ... }:

# Package: zot
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "zot";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "zot";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for zot";
    homepage = "https://github.com/TODO/zot";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
