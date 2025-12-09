{ lib, stdenv, fetchFromGitHub, ... }:

# Package: calico-kube-controllers-fips-3.31
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "calico-kube-controllers-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "calico-kube-controllers-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for calico-kube-controllers-fips";
    homepage = "https://github.com/TODO/calico-kube-controllers-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
