{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubevela-vela-core
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubevela-vela-core";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubevela-vela-core";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubevela-vela-core";
    homepage = "https://github.com/TODO/kubevela-vela-core";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
