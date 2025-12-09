{ lib, stdenv, fetchFromGitHub, ... }:

# Package: wayland-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "wayland-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "wayland-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for wayland-dev";
    homepage = "https://github.com/TODO/wayland-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
