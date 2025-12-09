{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kuberay-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kuberay-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kuberay-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kuberay-operator-fips";
    homepage = "https://github.com/TODO/kuberay-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
