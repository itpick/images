{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-http-negotiate
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-http-negotiate";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-http-negotiate";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-http-negotiate";
    homepage = "https://github.com/TODO/perl-http-negotiate";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
