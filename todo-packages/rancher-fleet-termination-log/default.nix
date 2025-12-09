{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rancher-fleet-termination-log
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rancher-fleet-termination-log";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rancher-fleet-termination-log";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rancher-fleet-termination-log";
    homepage = "https://github.com/TODO/rancher-fleet-termination-log";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
