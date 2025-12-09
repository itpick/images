{ lib, stdenv, fetchFromGitHub, ... }:

# Package: hwdata-pci
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "hwdata-pci";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "hwdata-pci";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for hwdata-pci";
    homepage = "https://github.com/TODO/hwdata-pci";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
