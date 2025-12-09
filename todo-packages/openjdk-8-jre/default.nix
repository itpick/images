{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openjdk-8-jre
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openjdk-8-jre";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openjdk-8-jre";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openjdk-8-jre";
    homepage = "https://github.com/TODO/openjdk-8-jre";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
