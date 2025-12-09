{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubernetes-dashboard-web-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubernetes-dashboard-web-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubernetes-dashboard-web-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubernetes-dashboard-web-fips";
    homepage = "https://github.com/TODO/kubernetes-dashboard-web-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
