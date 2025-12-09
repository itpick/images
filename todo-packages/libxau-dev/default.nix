{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libxau-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libxau-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libxau-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libxau-dev";
    homepage = "https://github.com/TODO/libxau-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
