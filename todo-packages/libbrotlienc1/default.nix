{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libbrotlienc1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libbrotlienc1";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libbrotlienc1";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libbrotlienc1";
    homepage = "https://github.com/TODO/libbrotlienc1";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
