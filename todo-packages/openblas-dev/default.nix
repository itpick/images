{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openblas-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openblas-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openblas-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openblas-dev";
    homepage = "https://github.com/TODO/openblas-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
