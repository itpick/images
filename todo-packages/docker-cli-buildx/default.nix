{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-cli-buildx
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-cli-buildx";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-cli-buildx";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-cli-buildx";
    homepage = "https://github.com/TODO/docker-cli-buildx";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
