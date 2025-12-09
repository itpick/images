{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubelet-csr-approver
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubelet-csr-approver";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubelet-csr-approver";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubelet-csr-approver";
    homepage = "https://github.com/TODO/kubelet-csr-approver";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
