{ lib, stdenv, fetchFromGitHub, ... }:

# Package: calico-node-3.31
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "calico-node";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "calico-node";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for calico-node";
    homepage = "https://github.com/TODO/calico-node";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
