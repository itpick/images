{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cloud-sql-proxy-2.18
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cloud-sql-proxy";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cloud-sql-proxy";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cloud-sql-proxy";
    homepage = "https://github.com/TODO/cloud-sql-proxy";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
