{ lib, stdenv, fetchFromGitHub, ... }:

# Package: clamav-1.5-scanner
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "clamav-1.5-scanner";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "clamav-1.5-scanner";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for clamav-1.5-scanner";
    homepage = "https://github.com/TODO/clamav-1.5-scanner";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
