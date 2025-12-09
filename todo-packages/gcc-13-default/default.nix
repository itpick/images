{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gcc-13-default
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gcc-13-default";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gcc-13-default";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gcc-13-default";
    homepage = "https://github.com/TODO/gcc-13-default";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
