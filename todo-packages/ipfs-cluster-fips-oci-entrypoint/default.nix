{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ipfs-cluster-fips-oci-entrypoint
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ipfs-cluster-fips-oci-entrypoint";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ipfs-cluster-fips-oci-entrypoint";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ipfs-cluster-fips-oci-entrypoint";
    homepage = "https://github.com/TODO/ipfs-cluster-fips-oci-entrypoint";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
