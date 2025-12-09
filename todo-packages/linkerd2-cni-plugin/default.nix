{ lib, stdenv, fetchFromGitHub, ... }:

# Package: linkerd2-cni-plugin
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "linkerd2-cni-plugin";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "linkerd2-cni-plugin";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for linkerd2-cni-plugin";
    homepage = "https://github.com/TODO/linkerd2-cni-plugin";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
