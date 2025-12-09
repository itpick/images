{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mesosphere-vsphere-csi-syncer
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mesosphere-vsphere-csi-syncer";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mesosphere-vsphere-csi-syncer";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mesosphere-vsphere-csi-syncer";
    homepage = "https://github.com/TODO/mesosphere-vsphere-csi-syncer";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
