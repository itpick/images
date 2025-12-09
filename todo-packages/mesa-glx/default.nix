{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mesa-glx
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mesa-glx";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mesa-glx";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mesa-glx";
    homepage = "https://github.com/TODO/mesa-glx";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
