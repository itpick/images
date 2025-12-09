{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dockerize
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dockerize";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dockerize";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dockerize";
    homepage = "https://github.com/TODO/dockerize";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
