{ lib, stdenv, fetchFromGitHub, ... }:

# Package: php-8.3-openssl
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "php-8.3-openssl";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "php-8.3-openssl";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for php-8.3-openssl";
    homepage = "https://github.com/TODO/php-8.3-openssl";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
