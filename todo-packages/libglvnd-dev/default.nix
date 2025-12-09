{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libglvnd-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libglvnd-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libglvnd-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libglvnd-dev";
    homepage = "https://github.com/TODO/libglvnd-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
