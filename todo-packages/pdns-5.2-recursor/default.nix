{ lib, stdenv, fetchFromGitHub, ... }:

# Package: pdns-5.2-recursor
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "pdns-5.2-recursor";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "pdns-5.2-recursor";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for pdns-5.2-recursor";
    homepage = "https://github.com/TODO/pdns-5.2-recursor";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
