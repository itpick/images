{ lib, stdenv, fetchFromGitHub, ... }:

# Package: google-cloud-sdk-core
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "google-cloud-sdk-core";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "google-cloud-sdk-core";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for google-cloud-sdk-core";
    homepage = "https://github.com/TODO/google-cloud-sdk-core";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
