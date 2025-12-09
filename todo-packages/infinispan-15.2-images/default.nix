{ lib, stdenv, fetchFromGitHub, ... }:

# Package: infinispan-15.2-images
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "infinispan-15.2-images";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "infinispan-15.2-images";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for infinispan-15.2-images";
    homepage = "https://github.com/TODO/infinispan-15.2-images";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
