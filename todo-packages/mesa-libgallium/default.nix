{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mesa-libgallium
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mesa-libgallium";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mesa-libgallium";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mesa-libgallium";
    homepage = "https://github.com/TODO/mesa-libgallium";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
