{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cluster-api-provider-vsphere-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cluster-api-provider-vsphere-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cluster-api-provider-vsphere-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cluster-api-provider-vsphere-fips";
    homepage = "https://github.com/TODO/cluster-api-provider-vsphere-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
