{ lib, stdenv, fetchFromGitHub, ... }:

# Package: xeol-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "xeol-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "xeol-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for xeol-fips";
    homepage = "https://github.com/TODO/xeol-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
