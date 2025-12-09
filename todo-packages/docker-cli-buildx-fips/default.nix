{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-cli-buildx-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-cli-buildx-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-cli-buildx-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-cli-buildx-fips";
    homepage = "https://github.com/TODO/docker-cli-buildx-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
