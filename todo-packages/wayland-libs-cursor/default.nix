{ lib, stdenv, fetchFromGitHub, ... }:

# Package: wayland-libs-cursor
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "wayland-libs-cursor";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "wayland-libs-cursor";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for wayland-libs-cursor";
    homepage = "https://github.com/TODO/wayland-libs-cursor";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
