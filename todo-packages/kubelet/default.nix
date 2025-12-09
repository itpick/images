{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubelet-1.33
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubelet";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubelet";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubelet";
    homepage = "https://github.com/TODO/kubelet";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
