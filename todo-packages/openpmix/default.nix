{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openpmix
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openpmix";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openpmix";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openpmix";
    homepage = "https://github.com/TODO/openpmix";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
