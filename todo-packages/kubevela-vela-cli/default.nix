{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubevela-vela-cli
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubevela-vela-cli";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubevela-vela-cli";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubevela-vela-cli";
    homepage = "https://github.com/TODO/kubevela-vela-cli";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
