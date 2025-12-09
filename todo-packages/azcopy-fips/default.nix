{ lib, stdenv, fetchFromGitHub, ... }:

# Package: azcopy-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "azcopy-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "azcopy-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for azcopy-fips";
    homepage = "https://github.com/TODO/azcopy-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
