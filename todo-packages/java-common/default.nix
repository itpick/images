{ lib, stdenv, fetchFromGitHub, ... }:

# Package: java-common
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "java-common";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "java-common";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for java-common";
    homepage = "https://github.com/TODO/java-common";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
