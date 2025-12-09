{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-clone
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-clone";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-clone";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-clone";
    homepage = "https://github.com/TODO/perl-clone";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
