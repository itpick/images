{ lib, stdenv, fetchFromGitHub, ... }:

# Package: zookeeper-fips-3.9
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "zookeeper-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "zookeeper-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for zookeeper-fips";
    homepage = "https://github.com/TODO/zookeeper-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
