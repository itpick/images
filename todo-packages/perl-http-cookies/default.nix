{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-http-cookies
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-http-cookies";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-http-cookies";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-http-cookies";
    homepage = "https://github.com/TODO/perl-http-cookies";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
