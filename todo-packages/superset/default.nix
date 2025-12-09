{ lib, stdenv, fetchFromGitHub, ... }:

# Package: superset-5.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "superset";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "superset";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for superset";
    homepage = "https://github.com/TODO/superset";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
