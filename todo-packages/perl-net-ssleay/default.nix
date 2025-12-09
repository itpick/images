{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-net-ssleay
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-net-ssleay";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-net-ssleay";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-net-ssleay";
    homepage = "https://github.com/TODO/perl-net-ssleay";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
