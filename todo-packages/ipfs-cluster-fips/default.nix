{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ipfs-cluster-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ipfs-cluster-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ipfs-cluster-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ipfs-cluster-fips";
    homepage = "https://github.com/TODO/ipfs-cluster-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
