{ lib, stdenv, fetchFromGitHub, ... }:

# Package: eks-distro-kube-apiserver-fips-1.34
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "eks-distro-kube-apiserver-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "eks-distro-kube-apiserver-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for eks-distro-kube-apiserver-fips";
    homepage = "https://github.com/TODO/eks-distro-kube-apiserver-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
