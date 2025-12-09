{ lib, stdenv, fetchFromGitHub, ... }:

# Package: victoriametrics-vmstorage-cluster-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "victoriametrics-vmstorage-cluster-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "victoriametrics-vmstorage-cluster-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for victoriametrics-vmstorage-cluster-fips";
    homepage = "https://github.com/TODO/victoriametrics-vmstorage-cluster-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
