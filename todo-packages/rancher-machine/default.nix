{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-machine
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-machine";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-machine";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-machine";
    homepage = "https://github.com/TODO/rancher-machine";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
