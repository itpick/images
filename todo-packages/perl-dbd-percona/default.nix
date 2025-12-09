{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-dbd-percona-8.0
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-dbd-percona";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-dbd-percona";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-dbd-percona";
    homepage = "https://github.com/TODO/perl-dbd-percona";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
