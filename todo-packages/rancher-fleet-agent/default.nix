{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-fleet-agent
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-fleet-agent";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-fleet-agent";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-fleet-agent";
    homepage = "https://github.com/TODO/rancher-fleet-agent";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
