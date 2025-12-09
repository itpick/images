{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cluster-api-ipam-provider-in-cluster
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cluster-api-ipam-provider-in-cluster";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cluster-api-ipam-provider-in-cluster";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cluster-api-ipam-provider-in-cluster";
    homepage = "https://github.com/TODO/cluster-api-ipam-provider-in-cluster";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
