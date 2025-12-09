{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nrdot-collector-k8s-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nrdot-collector-k8s-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nrdot-collector-k8s-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nrdot-collector-k8s-fips";
    homepage = "https://github.com/TODO/nrdot-collector-k8s-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
