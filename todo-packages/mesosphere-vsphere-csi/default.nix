{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mesosphere-vsphere-csi
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mesosphere-vsphere-csi";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mesosphere-vsphere-csi";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mesosphere-vsphere-csi";
    homepage = "https://github.com/TODO/mesosphere-vsphere-csi";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
