{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tetragon-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tetragon-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tetragon-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tetragon-operator-fips";
    homepage = "https://github.com/TODO/tetragon-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
