{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sox-ng-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sox-ng-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sox-ng-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sox-ng-dev";
    homepage = "https://github.com/TODO/sox-ng-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
