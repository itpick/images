{ lib, stdenv, fetchFromGitHub, ... }:

# Package: victoriametrics-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "victoriametrics-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "victoriametrics-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for victoriametrics-operator-fips";
    homepage = "https://github.com/TODO/victoriametrics-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
