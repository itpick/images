{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mongos-8.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mongos";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mongos";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mongos";
    homepage = "https://github.com/TODO/mongos";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
