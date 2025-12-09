{ lib, stdenv, fetchFromGitHub, ... }:

# Package: orthanc-explorer2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "orthanc-explorer2";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "orthanc-explorer2";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for orthanc-explorer2";
    homepage = "https://github.com/TODO/orthanc-explorer2";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
