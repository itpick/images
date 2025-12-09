{ lib, stdenv, fetchFromGitHub, ... }:

# Package: orthanc-postgresql
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "orthanc-postgresql";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "orthanc-postgresql";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for orthanc-postgresql";
    homepage = "https://github.com/TODO/orthanc-postgresql";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
