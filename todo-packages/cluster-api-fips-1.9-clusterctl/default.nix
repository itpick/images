{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cluster-api-fips-1.9-clusterctl
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cluster-api-fips-1.9-clusterctl";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cluster-api-fips-1.9-clusterctl";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cluster-api-fips-1.9-clusterctl";
    homepage = "https://github.com/TODO/cluster-api-fips-1.9-clusterctl";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
