{ lib, stdenv, fetchFromGitHub, ... }:

# Package: icu-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "icu-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "icu-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for icu-dev";
    homepage = "https://github.com/TODO/icu-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
