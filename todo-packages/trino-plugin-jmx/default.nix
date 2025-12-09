{ lib, stdenv, fetchFromGitHub, ... }:

# Package: trino-plugin-jmx
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "trino-plugin-jmx";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "trino-plugin-jmx";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for trino-plugin-jmx";
    homepage = "https://github.com/TODO/trino-plugin-jmx";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
