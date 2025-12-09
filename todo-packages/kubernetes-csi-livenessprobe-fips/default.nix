{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubernetes-csi-livenessprobe-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubernetes-csi-livenessprobe-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubernetes-csi-livenessprobe-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubernetes-csi-livenessprobe-fips";
    homepage = "https://github.com/TODO/kubernetes-csi-livenessprobe-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
