{ lib, stdenv, fetchFromGitHub, ... }:

# Package: oras-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "oras-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "oras-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for oras-fips";
    homepage = "https://github.com/TODO/oras-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
