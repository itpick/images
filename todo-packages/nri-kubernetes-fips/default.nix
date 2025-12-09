{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-kubernetes-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-kubernetes-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-kubernetes-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-kubernetes-fips";
    homepage = "https://github.com/TODO/nri-kubernetes-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
