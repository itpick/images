{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bouncycastle-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bouncycastle-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bouncycastle-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bouncycastle-fips";
    homepage = "https://github.com/TODO/bouncycastle-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
