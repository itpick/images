{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libxinerama-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libxinerama-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libxinerama-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libxinerama-dev";
    homepage = "https://github.com/TODO/libxinerama-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
