{ lib, stdenv, fetchFromGitHub, ... }:

# Package: apache-nifi-registry
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "apache-nifi-registry";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "apache-nifi-registry";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for apache-nifi-registry";
    homepage = "https://github.com/TODO/apache-nifi-registry";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
