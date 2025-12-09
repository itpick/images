{ lib, stdenv, fetchFromGitHub, ... }:

# Package: calico-goldmane-3.31
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "calico-goldmane";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "calico-goldmane";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for calico-goldmane";
    homepage = "https://github.com/TODO/calico-goldmane";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
