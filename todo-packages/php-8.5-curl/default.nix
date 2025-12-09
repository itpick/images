{ lib, stdenv, fetchFromGitHub, ... }:

# Package: php-8.5-curl
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "php-8.5-curl";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "php-8.5-curl";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for php-8.5-curl";
    homepage = "https://github.com/TODO/php-8.5-curl";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
