{ lib, stdenv, fetchFromGitHub, ... }:

# Package: adoptium-openjdk-bcfips-policy-140-3-j21
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "adoptium-openjdk-bcfips-policy-140-3-j21";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "adoptium-openjdk-bcfips-policy-140-3-j21";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for adoptium-openjdk-bcfips-policy-140-3-j21";
    homepage = "https://github.com/TODO/adoptium-openjdk-bcfips-policy-140-3-j21";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
