{ lib, stdenv, fetchFromGitHub, ... }:

# Package: lua5.4-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "lua5.4-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "lua5.4-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for lua5.4-libs";
    homepage = "https://github.com/TODO/lua5.4-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
