{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mongo-tools
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mongo-tools";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mongo-tools";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mongo-tools";
    homepage = "https://github.com/TODO/mongo-tools";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
