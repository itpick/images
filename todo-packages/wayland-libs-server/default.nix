{ lib, stdenv, fetchFromGitHub, ... }:

# Package: wayland-libs-server
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "wayland-libs-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "wayland-libs-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for wayland-libs-server";
    homepage = "https://github.com/TODO/wayland-libs-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
