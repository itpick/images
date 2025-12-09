{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cilium-1.18-clustermesh-apiserver
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cilium-1.18-clustermesh-apiserver";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cilium-1.18-clustermesh-apiserver";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cilium-1.18-clustermesh-apiserver";
    homepage = "https://github.com/TODO/cilium-1.18-clustermesh-apiserver";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
