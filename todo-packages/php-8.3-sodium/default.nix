{ lib, stdenv, fetchFromGitHub, ... }:

# Package: php-8.3-sodium
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "php-8.3-sodium";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "php-8.3-sodium";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for php-8.3-sodium";
    homepage = "https://github.com/TODO/php-8.3-sodium";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
