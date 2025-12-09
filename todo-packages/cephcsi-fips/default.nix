{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cephcsi-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cephcsi-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cephcsi-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cephcsi-fips";
    homepage = "https://github.com/TODO/cephcsi-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
