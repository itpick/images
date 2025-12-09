{ lib, stdenv, fetchFromGitHub, ... }:

# Package: elfutils-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "elfutils-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "elfutils-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for elfutils-dev";
    homepage = "https://github.com/TODO/elfutils-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
