{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kube-bench-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kube-bench-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kube-bench-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kube-bench-fips";
    homepage = "https://github.com/TODO/kube-bench-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
