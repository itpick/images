{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bats-assert
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bats-assert";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bats-assert";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bats-assert";
    homepage = "https://github.com/TODO/bats-assert";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
