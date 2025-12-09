{ lib, stdenv, fetchFromGitHub, ... }:

# Package: syft-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "syft-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "syft-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for syft-fips";
    homepage = "https://github.com/TODO/syft-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
