{ lib, stdenv, fetchFromGitHub, ... }:

# Package: calico-key-cert-provisioner-fips-3.31
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "calico-key-cert-provisioner-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "calico-key-cert-provisioner-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for calico-key-cert-provisioner-fips";
    homepage = "https://github.com/TODO/calico-key-cert-provisioner-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
