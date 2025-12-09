{ lib, stdenv, fetchFromGitHub, ... }:

# Package: pgpool2_exporter
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "pgpool2_exporter";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "pgpool2_exporter";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for pgpool2_exporter";
    homepage = "https://github.com/TODO/pgpool2_exporter";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
