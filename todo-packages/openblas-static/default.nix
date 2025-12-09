{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openblas-static
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openblas-static";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openblas-static";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openblas-static";
    homepage = "https://github.com/TODO/openblas-static";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
