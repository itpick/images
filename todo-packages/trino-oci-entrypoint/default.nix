{ lib, stdenv, fetchFromGitHub, ... }:

# Package: trino-oci-entrypoint
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "trino-oci-entrypoint";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "trino-oci-entrypoint";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for trino-oci-entrypoint";
    homepage = "https://github.com/TODO/trino-oci-entrypoint";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
