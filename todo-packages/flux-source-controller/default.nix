{ lib, stdenv, fetchFromGitHub, ... }:

# Package: flux-source-controller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "flux-source-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "flux-source-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for flux-source-controller";
    homepage = "https://github.com/TODO/flux-source-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
