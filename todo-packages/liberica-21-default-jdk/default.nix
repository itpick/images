{ lib, stdenv, fetchFromGitHub, ... }:

# Package: liberica-21-default-jdk
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "liberica-21-default-jdk";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "liberica-21-default-jdk";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for liberica-21-default-jdk";
    homepage = "https://github.com/TODO/liberica-21-default-jdk";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
