{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cloud-sql-proxy-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cloud-sql-proxy-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cloud-sql-proxy-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cloud-sql-proxy-fips";
    homepage = "https://github.com/TODO/cloud-sql-proxy-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
