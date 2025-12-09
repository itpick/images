{ lib, stdenv, fetchFromGitHub, ... }:

# Package: multus-cni-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "multus-cni-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "multus-cni-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for multus-cni-fips";
    homepage = "https://github.com/TODO/multus-cni-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
