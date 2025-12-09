{ lib, stdenv, fetchFromGitHub, ... }:

# Package: corretto-21-default-jvm
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "corretto-21-default-jvm";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "corretto-21-default-jvm";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for corretto-21-default-jvm";
    homepage = "https://github.com/TODO/corretto-21-default-jvm";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
