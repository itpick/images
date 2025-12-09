{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dockerize-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dockerize-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dockerize-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dockerize-fips";
    homepage = "https://github.com/TODO/dockerize-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
