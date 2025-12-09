{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tomcat-10.1-openjdk-21-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tomcat-10.1-openjdk-21-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tomcat-10.1-openjdk-21-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tomcat-10.1-openjdk-21-fips";
    homepage = "https://github.com/TODO/tomcat-10.1-openjdk-21-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
