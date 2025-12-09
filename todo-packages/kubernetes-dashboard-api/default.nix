{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubernetes-dashboard-api
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubernetes-dashboard-api";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubernetes-dashboard-api";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubernetes-dashboard-api";
    homepage = "https://github.com/TODO/kubernetes-dashboard-api";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
