{ lib, stdenv, fetchFromGitHub, ... }:

# Package: argo-events
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "argo-events";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "argo-events";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for argo-events";
    homepage = "https://github.com/TODO/argo-events";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
