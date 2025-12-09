{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cni-plugins-portmap
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cni-plugins-portmap";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cni-plugins-portmap";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cni-plugins-portmap";
    homepage = "https://github.com/TODO/cni-plugins-portmap";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
