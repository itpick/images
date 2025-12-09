{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-html-parser
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-html-parser";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-html-parser";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-html-parser";
    homepage = "https://github.com/TODO/perl-html-parser";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
