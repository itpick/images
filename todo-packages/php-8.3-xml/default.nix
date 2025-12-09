{ lib, stdenv, fetchFromGitHub, ... }:

# Package: php-8.3-xml
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "php-8.3-xml";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "php-8.3-xml";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for php-8.3-xml";
    homepage = "https://github.com/TODO/php-8.3-xml";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
