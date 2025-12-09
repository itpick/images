{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bouncycastle-pkix-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bouncycastle-pkix-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bouncycastle-pkix-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bouncycastle-pkix-fips";
    homepage = "https://github.com/TODO/bouncycastle-pkix-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
