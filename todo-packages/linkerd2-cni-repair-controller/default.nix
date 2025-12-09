{ lib, stdenv, fetchFromGitHub, ... }:

# Package: linkerd2-cni-repair-controller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "linkerd2-cni-repair-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "linkerd2-cni-repair-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for linkerd2-cni-repair-controller";
    homepage = "https://github.com/TODO/linkerd2-cni-repair-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
