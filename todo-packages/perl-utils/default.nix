{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-utils
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-utils";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-utils";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-utils";
    homepage = "https://github.com/TODO/perl-utils";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
