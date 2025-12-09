{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sriov-network-device-plugin
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sriov-network-device-plugin";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sriov-network-device-plugin";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sriov-network-device-plugin";
    homepage = "https://github.com/TODO/sriov-network-device-plugin";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
