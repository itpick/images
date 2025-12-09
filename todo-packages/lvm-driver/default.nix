{ lib, stdenv, fetchFromGitHub, ... }:

# Package: lvm-driver
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "lvm-driver";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "lvm-driver";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for lvm-driver";
    homepage = "https://github.com/TODO/lvm-driver";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
