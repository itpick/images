{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-uri
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-uri";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-uri";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-uri";
    homepage = "https://github.com/TODO/perl-uri";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
