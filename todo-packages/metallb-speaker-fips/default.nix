{ lib, stdenv, fetchFromGitHub, ... }:

# Package: metallb-speaker-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "metallb-speaker-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "metallb-speaker-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for metallb-speaker-fips";
    homepage = "https://github.com/TODO/metallb-speaker-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
