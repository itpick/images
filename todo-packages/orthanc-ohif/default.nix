{ lib, stdenv, fetchFromGitHub, ... }:

# Package: orthanc-ohif
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "orthanc-ohif";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "orthanc-ohif";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for orthanc-ohif";
    homepage = "https://github.com/TODO/orthanc-ohif";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
