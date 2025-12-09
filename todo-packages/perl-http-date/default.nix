{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-http-date
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-http-date";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-http-date";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-http-date";
    homepage = "https://github.com/TODO/perl-http-date";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
