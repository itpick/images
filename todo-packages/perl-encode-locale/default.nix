{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-encode-locale
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-encode-locale";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-encode-locale";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-encode-locale";
    homepage = "https://github.com/TODO/perl-encode-locale";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
