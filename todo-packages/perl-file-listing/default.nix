{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-file-listing
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-file-listing";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-file-listing";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-file-listing";
    homepage = "https://github.com/TODO/perl-file-listing";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
