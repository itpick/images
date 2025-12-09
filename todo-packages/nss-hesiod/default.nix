{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nss-hesiod
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nss-hesiod";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nss-hesiod";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nss-hesiod";
    homepage = "https://github.com/TODO/nss-hesiod";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
