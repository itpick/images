{ lib, stdenv, fetchFromGitHub, ... }:

# Package: corretto-25-jre
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "corretto-25-jre";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "corretto-25-jre";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for corretto-25-jre";
    homepage = "https://github.com/TODO/corretto-25-jre";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
