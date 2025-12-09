{ lib, stdenv, fetchFromGitHub, ... }:

# Package: open-vmdk
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "open-vmdk";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "open-vmdk";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for open-vmdk";
    homepage = "https://github.com/TODO/open-vmdk";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
