{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nfs-subdir-external-provisioner-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nfs-subdir-external-provisioner-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nfs-subdir-external-provisioner-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nfs-subdir-external-provisioner-fips";
    homepage = "https://github.com/TODO/nfs-subdir-external-provisioner-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
