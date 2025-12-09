{ lib, stdenv, fetchFromGitHub, ... }:

# Package: azuredisk-csi-fips-1.33
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "azuredisk-csi-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "azuredisk-csi-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for azuredisk-csi-fips";
    homepage = "https://github.com/TODO/azuredisk-csi-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
