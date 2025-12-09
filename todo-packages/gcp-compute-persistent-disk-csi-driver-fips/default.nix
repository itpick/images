{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gcp-compute-persistent-disk-csi-driver-fips-1.21
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gcp-compute-persistent-disk-csi-driver-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gcp-compute-persistent-disk-csi-driver-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gcp-compute-persistent-disk-csi-driver-fips";
    homepage = "https://github.com/TODO/gcp-compute-persistent-disk-csi-driver-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
