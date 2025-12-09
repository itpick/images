{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-dbi
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-dbi";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-dbi";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-dbi";
    homepage = "https://github.com/TODO/perl-dbi";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
