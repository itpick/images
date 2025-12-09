{ lib, stdenv, fetchFromGitHub, ... }:

# Package: lua-resty-http
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "lua-resty-http";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "lua-resty-http";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for lua-resty-http";
    homepage = "https://github.com/TODO/lua-resty-http";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
