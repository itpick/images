{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cluster-api-aws-controller-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cluster-api-aws-controller-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cluster-api-aws-controller-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cluster-api-aws-controller-fips";
    homepage = "https://github.com/TODO/cluster-api-aws-controller-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
