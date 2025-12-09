{ lib, stdenv, fetchFromGitHub, ... }:

# Package: victoriametrics-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "victoriametrics-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "victoriametrics-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for victoriametrics-fips";
    homepage = "https://github.com/TODO/victoriametrics-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
