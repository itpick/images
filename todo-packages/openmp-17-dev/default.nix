{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openmp-17-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openmp-17-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openmp-17-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openmp-17-dev";
    homepage = "https://github.com/TODO/openmp-17-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
