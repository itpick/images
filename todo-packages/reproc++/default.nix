{ lib, stdenv, fetchFromGitHub, ... }:

# Package: reproc++
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "reproc++";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "reproc++";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for reproc++";
    homepage = "https://github.com/TODO/reproc++";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
