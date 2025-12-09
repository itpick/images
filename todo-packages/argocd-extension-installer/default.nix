{ lib, stdenv, fetchFromGitHub, ... }:

# Package: argocd-extension-installer
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "argocd-extension-installer";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "argocd-extension-installer";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for argocd-extension-installer";
    homepage = "https://github.com/TODO/argocd-extension-installer";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
