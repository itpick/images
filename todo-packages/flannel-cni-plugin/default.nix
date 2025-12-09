{ lib, stdenv, fetchFromGitHub, ... }:

# Package: flannel-cni-plugin
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "flannel-cni-plugin";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "flannel-cni-plugin";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for flannel-cni-plugin";
    homepage = "https://github.com/TODO/flannel-cni-plugin";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
