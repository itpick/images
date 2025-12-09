{ lib, stdenv, fetchFromGitHub, ... }:

# Package: seaweedfs-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "seaweedfs-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "seaweedfs-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for seaweedfs-fips";
    homepage = "https://github.com/TODO/seaweedfs-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
