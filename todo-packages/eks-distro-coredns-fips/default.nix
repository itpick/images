{ lib, stdenv, fetchFromGitHub, ... }:

# Package: eks-distro-coredns-fips-1.34
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "eks-distro-coredns-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "eks-distro-coredns-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for eks-distro-coredns-fips";
    homepage = "https://github.com/TODO/eks-distro-coredns-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
