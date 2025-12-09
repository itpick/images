{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-dind
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-dind";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-dind";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-dind";
    homepage = "https://github.com/TODO/docker-dind";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
