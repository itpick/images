{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openjdk-bcfips-policy-140-3-j11
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openjdk-bcfips-policy-140-3-j11";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openjdk-bcfips-policy-140-3-j11";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openjdk-bcfips-policy-140-3-j11";
    homepage = "https://github.com/TODO/openjdk-bcfips-policy-140-3-j11";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
