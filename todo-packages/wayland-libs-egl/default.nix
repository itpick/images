{ lib, stdenv, fetchFromGitHub, ... }:

# Package: wayland-libs-egl
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "wayland-libs-egl";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "wayland-libs-egl";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for wayland-libs-egl";
    homepage = "https://github.com/TODO/wayland-libs-egl";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
