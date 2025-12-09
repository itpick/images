{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kube-bench-configs-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kube-bench-configs-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kube-bench-configs-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kube-bench-configs-fips";
    homepage = "https://github.com/TODO/kube-bench-configs-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
