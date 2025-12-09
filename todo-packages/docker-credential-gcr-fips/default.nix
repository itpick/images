{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-credential-gcr-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-credential-gcr-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-credential-gcr-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-credential-gcr-fips";
    homepage = "https://github.com/TODO/docker-credential-gcr-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
