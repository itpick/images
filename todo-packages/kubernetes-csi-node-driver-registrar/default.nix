{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubernetes-csi-node-driver-registrar-2.15
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubernetes-csi-node-driver-registrar";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubernetes-csi-node-driver-registrar";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubernetes-csi-node-driver-registrar";
    homepage = "https://github.com/TODO/kubernetes-csi-node-driver-registrar";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
