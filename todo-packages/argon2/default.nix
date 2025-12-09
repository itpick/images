{ lib, stdenv, fetchFromGitHub, ... }:

# Package: argon2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "argon2";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "argon2";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for argon2";
    homepage = "https://github.com/TODO/argon2";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
