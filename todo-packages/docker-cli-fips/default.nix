{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-cli-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-cli-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-cli-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-cli-fips";
    homepage = "https://github.com/TODO/docker-cli-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
