{ lib, stdenv, fetchFromGitHub, ... }:

# Package: trino-plugin-memory
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "trino-plugin-memory";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "trino-plugin-memory";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for trino-plugin-memory";
    homepage = "https://github.com/TODO/trino-plugin-memory";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
