{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubernetes-csi-external-resizer
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubernetes-csi-external-resizer";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubernetes-csi-external-resizer";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubernetes-csi-external-resizer";
    homepage = "https://github.com/TODO/kubernetes-csi-external-resizer";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
