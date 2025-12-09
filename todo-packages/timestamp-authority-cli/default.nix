{ lib, stdenv, fetchFromGitHub, ... }:

# Package: timestamp-authority-cli
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "timestamp-authority-cli";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "timestamp-authority-cli";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for timestamp-authority-cli";
    homepage = "https://github.com/TODO/timestamp-authority-cli";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
