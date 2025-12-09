{ lib, stdenv, fetchFromGitHub, ... }:

# Package: amazon-k8s-cni-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "amazon-k8s-cni-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "amazon-k8s-cni-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for amazon-k8s-cni-fips";
    homepage = "https://github.com/TODO/amazon-k8s-cni-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
