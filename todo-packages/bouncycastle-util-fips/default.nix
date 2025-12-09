{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bouncycastle-util-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bouncycastle-util-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bouncycastle-util-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bouncycastle-util-fips";
    homepage = "https://github.com/TODO/bouncycastle-util-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
