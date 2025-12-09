{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libx11-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libx11-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libx11-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libx11-dev";
    homepage = "https://github.com/TODO/libx11-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
