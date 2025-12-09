{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nfs-subdir-external-provisioner
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nfs-subdir-external-provisioner";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nfs-subdir-external-provisioner";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nfs-subdir-external-provisioner";
    homepage = "https://github.com/TODO/nfs-subdir-external-provisioner";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
