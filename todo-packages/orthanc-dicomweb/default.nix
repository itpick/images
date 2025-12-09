{ lib, stdenv, fetchFromGitHub, ... }:

# Package: orthanc-dicomweb
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "orthanc-dicomweb";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "orthanc-dicomweb";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for orthanc-dicomweb";
    homepage = "https://github.com/TODO/orthanc-dicomweb";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
