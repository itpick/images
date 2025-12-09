{ lib, stdenv, fetchFromGitHub, ... }:

# Package: uuidgen
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "uuidgen";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "uuidgen";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for uuidgen";
    homepage = "https://github.com/TODO/uuidgen";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
