{ lib, stdenv, fetchFromGitHub, ... }:

# Package: influxd-2.7
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "influxd";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "influxd";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for influxd";
    homepage = "https://github.com/TODO/influxd";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
