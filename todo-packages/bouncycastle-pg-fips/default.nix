{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bouncycastle-pg-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bouncycastle-pg-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bouncycastle-pg-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bouncycastle-pg-fips";
    homepage = "https://github.com/TODO/bouncycastle-pg-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
