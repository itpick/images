{ lib, stdenv, fetchFromGitHub, ... }:

# Package: pgadmin4-oci-entrypoint
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "pgadmin4-oci-entrypoint";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "pgadmin4-oci-entrypoint";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for pgadmin4-oci-entrypoint";
    homepage = "https://github.com/TODO/pgadmin4-oci-entrypoint";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
