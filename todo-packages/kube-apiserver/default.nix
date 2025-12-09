{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kube-apiserver-1.34
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kube-apiserver";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kube-apiserver";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kube-apiserver";
    homepage = "https://github.com/TODO/kube-apiserver";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
