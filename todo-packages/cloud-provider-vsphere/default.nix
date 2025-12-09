{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cloud-provider-vsphere
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cloud-provider-vsphere";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cloud-provider-vsphere";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cloud-provider-vsphere";
    homepage = "https://github.com/TODO/cloud-provider-vsphere";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
