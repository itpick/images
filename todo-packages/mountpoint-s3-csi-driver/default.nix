{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mountpoint-s3-csi-driver-2.2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mountpoint-s3-csi-driver";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mountpoint-s3-csi-driver";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mountpoint-s3-csi-driver";
    homepage = "https://github.com/TODO/mountpoint-s3-csi-driver";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
