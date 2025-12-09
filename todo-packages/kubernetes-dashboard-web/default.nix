{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubernetes-dashboard-web
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubernetes-dashboard-web";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubernetes-dashboard-web";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubernetes-dashboard-web";
    homepage = "https://github.com/TODO/kubernetes-dashboard-web";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
