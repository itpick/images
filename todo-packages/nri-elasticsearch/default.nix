{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-elasticsearch
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-elasticsearch";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-elasticsearch";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-elasticsearch";
    homepage = "https://github.com/TODO/nri-elasticsearch";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
