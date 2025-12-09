{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gnutar-rmt
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gnutar-rmt";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gnutar-rmt";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gnutar-rmt";
    homepage = "https://github.com/TODO/gnutar-rmt";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
