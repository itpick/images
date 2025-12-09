{ lib, stdenv, fetchFromGitHub, ... }:

# Package: build-base
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "build-base";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "build-base";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for build-base";
    homepage = "https://github.com/TODO/build-base";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
