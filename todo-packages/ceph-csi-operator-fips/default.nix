{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ceph-csi-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ceph-csi-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ceph-csi-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ceph-csi-operator-fips";
    homepage = "https://github.com/TODO/ceph-csi-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
