{ lib, stdenv, fetchFromGitHub, ... }:

# Package: orthanc-gdcm
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "orthanc-gdcm";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "orthanc-gdcm";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for orthanc-gdcm";
    homepage = "https://github.com/TODO/orthanc-gdcm";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
