{ lib, stdenv, fetchFromGitHub, ... }:

# Package: shadow-subids
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "shadow-subids";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "shadow-subids";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for shadow-subids";
    homepage = "https://github.com/TODO/shadow-subids";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
