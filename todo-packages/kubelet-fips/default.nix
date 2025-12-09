{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubelet-fips-1.34
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubelet-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubelet-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubelet-fips";
    homepage = "https://github.com/TODO/kubelet-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
