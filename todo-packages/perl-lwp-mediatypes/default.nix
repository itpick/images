{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-lwp-mediatypes
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-lwp-mediatypes";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-lwp-mediatypes";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-lwp-mediatypes";
    homepage = "https://github.com/TODO/perl-lwp-mediatypes";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
