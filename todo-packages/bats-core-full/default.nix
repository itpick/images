{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bats-core-full
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bats-core-full";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bats-core-full";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bats-core-full";
    homepage = "https://github.com/TODO/bats-core-full";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
