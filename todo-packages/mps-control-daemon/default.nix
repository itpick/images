{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mps-control-daemon
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mps-control-daemon";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mps-control-daemon";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mps-control-daemon";
    homepage = "https://github.com/TODO/mps-control-daemon";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
