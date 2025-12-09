{ lib, stdenv, fetchFromGitHub, ... }:

# Package: orthanc-python
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "orthanc-python";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "orthanc-python";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for orthanc-python";
    homepage = "https://github.com/TODO/orthanc-python";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
