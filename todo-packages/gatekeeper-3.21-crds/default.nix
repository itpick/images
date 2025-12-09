{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gatekeeper-3.21-crds
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gatekeeper-3.21-crds";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gatekeeper-3.21-crds";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gatekeeper-3.21-crds";
    homepage = "https://github.com/TODO/gatekeeper-3.21-crds";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
