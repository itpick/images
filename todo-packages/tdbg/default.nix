{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tdbg
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tdbg";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tdbg";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tdbg";
    homepage = "https://github.com/TODO/tdbg";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
