{ lib, stdenv, fetchFromGitHub, ... }:

# Package: apache-apisix
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "apache-apisix";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "apache-apisix";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for apache-apisix";
    homepage = "https://github.com/TODO/apache-apisix";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
