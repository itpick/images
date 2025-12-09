{ lib, stdenv, fetchFromGitHub, ... }:

# Package: minio-operator-sidecar-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "minio-operator-sidecar-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "minio-operator-sidecar-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for minio-operator-sidecar-fips";
    homepage = "https://github.com/TODO/minio-operator-sidecar-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
