{ lib, stdenv, fetchFromGitHub, ... }:

# Package: apache2-utils
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "apache2-utils";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "apache2-utils";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for apache2-utils";
    homepage = "https://github.com/TODO/apache2-utils";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
