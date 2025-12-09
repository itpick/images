{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openjdk-11-default-jvm
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openjdk-11-default-jvm";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openjdk-11-default-jvm";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openjdk-11-default-jvm";
    homepage = "https://github.com/TODO/openjdk-11-default-jvm";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
