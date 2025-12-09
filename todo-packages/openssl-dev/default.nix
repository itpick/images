{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openssl-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openssl-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openssl-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openssl-dev";
    homepage = "https://github.com/TODO/openssl-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
