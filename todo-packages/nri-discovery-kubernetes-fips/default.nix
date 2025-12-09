{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-discovery-kubernetes-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-discovery-kubernetes-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-discovery-kubernetes-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-discovery-kubernetes-fips";
    homepage = "https://github.com/TODO/nri-discovery-kubernetes-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
