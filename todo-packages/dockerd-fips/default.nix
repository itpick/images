{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dockerd-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dockerd-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dockerd-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dockerd-fips";
    homepage = "https://github.com/TODO/dockerd-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
