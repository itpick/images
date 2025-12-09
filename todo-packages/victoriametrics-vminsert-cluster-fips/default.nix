{ lib, stdenv, fetchFromGitHub, ... }:

# Package: victoriametrics-vminsert-cluster-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "victoriametrics-vminsert-cluster-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "victoriametrics-vminsert-cluster-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for victoriametrics-vminsert-cluster-fips";
    homepage = "https://github.com/TODO/victoriametrics-vminsert-cluster-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
