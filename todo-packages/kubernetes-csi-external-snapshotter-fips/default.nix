{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubernetes-csi-external-snapshotter-fips-8.4
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubernetes-csi-external-snapshotter-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubernetes-csi-external-snapshotter-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubernetes-csi-external-snapshotter-fips";
    homepage = "https://github.com/TODO/kubernetes-csi-external-snapshotter-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
