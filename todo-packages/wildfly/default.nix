{ lib, stdenv, fetchFromGitHub, ... }:

# Package: wildfly
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "wildfly";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "wildfly";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for wildfly";
    homepage = "https://github.com/TODO/wildfly";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
