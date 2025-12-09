{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mysql-9.5-oci-entrypoint
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mysql-9.5-oci-entrypoint";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mysql-9.5-oci-entrypoint";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mysql-9.5-oci-entrypoint";
    homepage = "https://github.com/TODO/mysql-9.5-oci-entrypoint";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
