{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gomplate-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gomplate-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gomplate-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gomplate-fips";
    homepage = "https://github.com/TODO/gomplate-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
