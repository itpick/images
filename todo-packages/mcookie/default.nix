{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mcookie
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mcookie";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mcookie";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mcookie";
    homepage = "https://github.com/TODO/mcookie";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
