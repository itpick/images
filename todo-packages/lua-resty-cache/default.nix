{ lib, stdenv, fetchFromGitHub, ... }:

# Package: lua-resty-cache
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "lua-resty-cache";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "lua-resty-cache";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for lua-resty-cache";
    homepage = "https://github.com/TODO/lua-resty-cache";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
