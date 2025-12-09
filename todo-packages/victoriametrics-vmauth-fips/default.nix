{ lib, stdenv, fetchFromGitHub, ... }:

# Package: victoriametrics-vmauth-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "victoriametrics-vmauth-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "victoriametrics-vmauth-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for victoriametrics-vmauth-fips";
    homepage = "https://github.com/TODO/victoriametrics-vmauth-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
