{ lib, stdenv, fetchFromGitHub, ... }:

# Package: conftest-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "conftest-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "conftest-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for conftest-fips";
    homepage = "https://github.com/TODO/conftest-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
