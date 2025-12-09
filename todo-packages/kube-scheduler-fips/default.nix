{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kube-scheduler-fips-1.34
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kube-scheduler-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kube-scheduler-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kube-scheduler-fips";
    homepage = "https://github.com/TODO/kube-scheduler-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
