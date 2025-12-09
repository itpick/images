{ lib, stdenv, fetchFromGitHub, ... }:

# Package: perl-net-http
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "perl-net-http";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "perl-net-http";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for perl-net-http";
    homepage = "https://github.com/TODO/perl-net-http";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
