{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cni-plugins-host-local
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cni-plugins-host-local";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cni-plugins-host-local";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cni-plugins-host-local";
    homepage = "https://github.com/TODO/cni-plugins-host-local";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
