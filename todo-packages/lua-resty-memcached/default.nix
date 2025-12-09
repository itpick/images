{ lib, stdenv, fetchFromGitHub, ... }:

# Package: lua-resty-memcached
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "lua-resty-memcached";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "lua-resty-memcached";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for lua-resty-memcached";
    homepage = "https://github.com/TODO/lua-resty-memcached";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
