{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tetragon-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tetragon-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tetragon-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tetragon-fips";
    homepage = "https://github.com/TODO/tetragon-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
