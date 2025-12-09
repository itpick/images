{ lib, stdenv, fetchFromGitHub, ... }:

# Package: lua-json4
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "lua-json4";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "lua-json4";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for lua-json4";
    homepage = "https://github.com/TODO/lua-json4";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
