{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cni-plugins-loopback
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cni-plugins-loopback";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cni-plugins-loopback";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cni-plugins-loopback";
    homepage = "https://github.com/TODO/cni-plugins-loopback";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
