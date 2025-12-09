{ lib, stdenv, fetchFromGitHub, ... }:

# Package: infinispan-15.2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "infinispan";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "infinispan";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for infinispan";
    homepage = "https://github.com/TODO/infinispan";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
