{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kubevela-vela-core-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kubevela-vela-core-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kubevela-vela-core-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kubevela-vela-core-fips";
    homepage = "https://github.com/TODO/kubevela-vela-core-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
