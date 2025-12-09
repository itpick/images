{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libbrotlicommon1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libbrotlicommon1";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libbrotlicommon1";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libbrotlicommon1";
    homepage = "https://github.com/TODO/libbrotlicommon1";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
