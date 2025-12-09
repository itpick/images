{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dogstatsd
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dogstatsd";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dogstatsd";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dogstatsd";
    homepage = "https://github.com/TODO/dogstatsd";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
