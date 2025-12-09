{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ml-metadata-store-server
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ml-metadata-store-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ml-metadata-store-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ml-metadata-store-server";
    homepage = "https://github.com/TODO/ml-metadata-store-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
