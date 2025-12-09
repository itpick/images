{ lib, stdenv, fetchFromGitHub, ... }:

# Package: superset-5.0-entrypoint
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "superset-5.0-entrypoint";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "superset-5.0-entrypoint";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for superset-5.0-entrypoint";
    homepage = "https://github.com/TODO/superset-5.0-entrypoint";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
