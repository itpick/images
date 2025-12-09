{ lib, stdenv, fetchFromGitHub, ... }:

# Package: eks-distro-kube-proxy-1.34
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "eks-distro-kube-proxy";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "eks-distro-kube-proxy";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for eks-distro-kube-proxy";
    homepage = "https://github.com/TODO/eks-distro-kube-proxy";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
