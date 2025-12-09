{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bats-support
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bats-support";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bats-support";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bats-support";
    homepage = "https://github.com/TODO/bats-support";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
