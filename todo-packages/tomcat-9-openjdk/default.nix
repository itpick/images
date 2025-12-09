{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tomcat-9-openjdk-17
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tomcat-9-openjdk";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tomcat-9-openjdk";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tomcat-9-openjdk";
    homepage = "https://github.com/TODO/tomcat-9-openjdk";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
