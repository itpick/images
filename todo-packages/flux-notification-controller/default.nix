{ lib, stdenv, fetchFromGitHub, ... }:

# Package: flux-notification-controller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "flux-notification-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "flux-notification-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for flux-notification-controller";
    homepage = "https://github.com/TODO/flux-notification-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
