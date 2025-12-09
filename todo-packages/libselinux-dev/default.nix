{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libselinux-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libselinux-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libselinux-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libselinux-dev";
    homepage = "https://github.com/TODO/libselinux-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
