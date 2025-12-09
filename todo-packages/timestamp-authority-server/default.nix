{ lib, stdenv, fetchFromGitHub, ... }:

# Package: timestamp-authority-server
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "timestamp-authority-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "timestamp-authority-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for timestamp-authority-server";
    homepage = "https://github.com/TODO/timestamp-authority-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
