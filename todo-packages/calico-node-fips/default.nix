{ lib, stdenv, fetchFromGitHub, ... }:

# Package: calico-node-fips-3.31
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "calico-node-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "calico-node-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for calico-node-fips";
    homepage = "https://github.com/TODO/calico-node-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
