{ lib, stdenv, fetchFromGitHub, ... }:

# Package: metallb-frr-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "metallb-frr-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "metallb-frr-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for metallb-frr-fips";
    homepage = "https://github.com/TODO/metallb-frr-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
