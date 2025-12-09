{ lib, stdenv, fetchFromGitHub, ... }:

# Package: amazon-k8s-cni
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "amazon-k8s-cni";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "amazon-k8s-cni";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for amazon-k8s-cni";
    homepage = "https://github.com/TODO/amazon-k8s-cni";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
