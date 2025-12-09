{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bats-core
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bats-core";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bats-core";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bats-core";
    homepage = "https://github.com/TODO/bats-core";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
