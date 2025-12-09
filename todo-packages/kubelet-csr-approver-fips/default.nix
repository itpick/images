{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubelet-csr-approver-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubelet-csr-approver-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubelet-csr-approver-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubelet-csr-approver-fips";
    homepage = "https://github.com/TODO/kubelet-csr-approver-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
