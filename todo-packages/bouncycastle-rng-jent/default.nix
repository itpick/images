{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bouncycastle-rng-jent
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bouncycastle-rng-jent";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bouncycastle-rng-jent";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bouncycastle-rng-jent";
    homepage = "https://github.com/TODO/bouncycastle-rng-jent";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
