{ lib, stdenv, fetchFromGitHub, ... }:

# Package: pixman-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "pixman-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "pixman-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for pixman-dev";
    homepage = "https://github.com/TODO/pixman-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
