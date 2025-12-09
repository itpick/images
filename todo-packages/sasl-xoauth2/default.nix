{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sasl-xoauth2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sasl-xoauth2";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sasl-xoauth2";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sasl-xoauth2";
    homepage = "https://github.com/TODO/sasl-xoauth2";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
