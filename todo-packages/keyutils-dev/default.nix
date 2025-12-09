{ lib, stdenv, fetchFromGitHub, ... }:

# Package: keyutils-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "keyutils-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "keyutils-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for keyutils-dev";
    homepage = "https://github.com/TODO/keyutils-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
