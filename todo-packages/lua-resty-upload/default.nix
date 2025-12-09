{ lib, stdenv, fetchFromGitHub, ... }:

# Package: lua-resty-upload
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "lua-resty-upload";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "lua-resty-upload";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for lua-resty-upload";
    homepage = "https://github.com/TODO/lua-resty-upload";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
