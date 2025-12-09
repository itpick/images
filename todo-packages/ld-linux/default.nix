{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ld-linux
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ld-linux";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ld-linux";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ld-linux";
    homepage = "https://github.com/TODO/ld-linux";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
