{ lib, stdenv, fetchFromGitHub, ... }:

# Package: liberica-21-default-jvm
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "liberica-21-default-jvm";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "liberica-21-default-jvm";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for liberica-21-default-jvm";
    homepage = "https://github.com/TODO/liberica-21-default-jvm";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
