{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-machine-driver-harvester
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-machine-driver-harvester";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-machine-driver-harvester";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-machine-driver-harvester";
    homepage = "https://github.com/TODO/docker-machine-driver-harvester";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
