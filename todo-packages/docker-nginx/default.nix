{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-nginx
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-nginx";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-nginx";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-nginx";
    homepage = "https://github.com/TODO/docker-nginx";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
