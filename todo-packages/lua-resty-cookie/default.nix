{ lib, stdenv, fetchFromGitHub, ... }:

# Package: lua-resty-cookie
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "lua-resty-cookie";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "lua-resty-cookie";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for lua-resty-cookie";
    homepage = "https://github.com/TODO/lua-resty-cookie";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
