{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-fips";
    homepage = "https://github.com/TODO/docker-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
