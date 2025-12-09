{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubernetes-csi-livenessprobe
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubernetes-csi-livenessprobe";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubernetes-csi-livenessprobe";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubernetes-csi-livenessprobe";
    homepage = "https://github.com/TODO/kubernetes-csi-livenessprobe";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
