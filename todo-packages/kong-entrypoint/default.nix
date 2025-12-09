{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kong-entrypoint
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kong-entrypoint";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kong-entrypoint";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kong-entrypoint";
    homepage = "https://github.com/TODO/kong-entrypoint";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
