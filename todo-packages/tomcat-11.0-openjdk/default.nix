{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tomcat-11.0-openjdk-21
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tomcat-11.0-openjdk";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tomcat-11.0-openjdk";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tomcat-11.0-openjdk";
    homepage = "https://github.com/TODO/tomcat-11.0-openjdk";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
