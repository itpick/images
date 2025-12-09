{ lib, stdenv, fetchFromGitHub, ... }:

# Package: seaweedfs-operator-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "seaweedfs-operator-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "seaweedfs-operator-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for seaweedfs-operator-fips";
    homepage = "https://github.com/TODO/seaweedfs-operator-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
