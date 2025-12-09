{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-http-message
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-http-message";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-http-message";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-http-message";
    homepage = "https://github.com/TODO/perl-http-message";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
