{ lib, stdenv, fetchFromGitHub, ... }:

# Package: aws-ebs-csi-driver-fips-1.53
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "aws-ebs-csi-driver-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "aws-ebs-csi-driver-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for aws-ebs-csi-driver-fips";
    homepage = "https://github.com/TODO/aws-ebs-csi-driver-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
