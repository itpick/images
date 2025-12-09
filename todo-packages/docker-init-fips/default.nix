{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-init-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-init-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-init-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-init-fips";
    homepage = "https://github.com/TODO/docker-init-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
