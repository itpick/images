{ lib, stdenv, fetchFromGitHub, ... }:

# Package: pgpool2-4.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "pgpool2";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "pgpool2";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for pgpool2";
    homepage = "https://github.com/TODO/pgpool2";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
