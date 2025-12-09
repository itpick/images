{ lib, stdenv, fetchFromGitHub, ... }:

# Package: docker-machine-driver-linode
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "docker-machine-driver-linode";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "docker-machine-driver-linode";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for docker-machine-driver-linode";
    homepage = "https://github.com/TODO/docker-machine-driver-linode";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
