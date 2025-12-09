{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mongod-8.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mongod";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mongod";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mongod";
    homepage = "https://github.com/TODO/mongod";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
