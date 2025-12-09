{ lib, stdenv, fetchFromGitHub, ... }:

# Package: open-liberty-kernel
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "open-liberty-kernel";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "open-liberty-kernel";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for open-liberty-kernel";
    homepage = "https://github.com/TODO/open-liberty-kernel";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
