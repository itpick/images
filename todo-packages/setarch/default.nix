{ lib, stdenv, fetchFromGitHub, ... }:

# Package: setarch
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "setarch";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "setarch";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for setarch";
    homepage = "https://github.com/TODO/setarch";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
