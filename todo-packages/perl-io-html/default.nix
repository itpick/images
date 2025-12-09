{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-io-html
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-io-html";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-io-html";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-io-html";
    homepage = "https://github.com/TODO/perl-io-html";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
