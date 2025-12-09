{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nri-jmx
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nri-jmx";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nri-jmx";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nri-jmx";
    homepage = "https://github.com/TODO/nri-jmx";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
