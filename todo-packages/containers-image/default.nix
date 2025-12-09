{ lib, stdenv, fetchFromGitHub, ... }:

# Package: containers-image
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "containers-image";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "containers-image";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for containers-image";
    homepage = "https://github.com/TODO/containers-image";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
