{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-fleet-cli
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-fleet-cli";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-fleet-cli";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-fleet-cli";
    homepage = "https://github.com/TODO/rancher-fleet-cli";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
