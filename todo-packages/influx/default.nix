{ lib, stdenv, fetchFromGitHub, ... }:

# Package: influx
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "influx";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "influx";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for influx";
    homepage = "https://github.com/TODO/influx";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
