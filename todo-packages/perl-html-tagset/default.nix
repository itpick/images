{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-html-tagset
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-html-tagset";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-html-tagset";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-html-tagset";
    homepage = "https://github.com/TODO/perl-html-tagset";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
