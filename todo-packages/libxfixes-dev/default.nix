{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libxfixes-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libxfixes-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libxfixes-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libxfixes-dev";
    homepage = "https://github.com/TODO/libxfixes-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
