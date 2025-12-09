{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-fleet-controller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-fleet-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-fleet-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-fleet-controller";
    homepage = "https://github.com/TODO/rancher-fleet-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
