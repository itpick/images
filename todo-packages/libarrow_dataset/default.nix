{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libarrow_dataset
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libarrow_dataset";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libarrow_dataset";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libarrow_dataset";
    homepage = "https://github.com/TODO/libarrow_dataset";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
