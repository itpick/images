{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libssl3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libssl3";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libssl3";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libssl3";
    homepage = "https://github.com/TODO/libssl3";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
