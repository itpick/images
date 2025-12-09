{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bouncycastle-tls-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bouncycastle-tls-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bouncycastle-tls-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bouncycastle-tls-fips";
    homepage = "https://github.com/TODO/bouncycastle-tls-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
