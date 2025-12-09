{ lib, stdenv, fetchFromGitHub, ... }:

# Package: lua-resty-core
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "lua-resty-core";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "lua-resty-core";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for lua-resty-core";
    homepage = "https://github.com/TODO/lua-resty-core";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
