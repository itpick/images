{ lib, stdenv, fetchFromGitHub, ... }:

# Package: lua-cjson
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "lua-cjson";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "lua-cjson";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for lua-cjson";
    homepage = "https://github.com/TODO/lua-cjson";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
