{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rke2-cloud-provider-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rke2-cloud-provider-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rke2-cloud-provider-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rke2-cloud-provider-fips";
    homepage = "https://github.com/TODO/rke2-cloud-provider-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
