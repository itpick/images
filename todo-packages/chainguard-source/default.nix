{ lib, stdenv, fetchFromGitHub, ... }:

# Package: chainguard-source
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "chainguard-source";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "chainguard-source";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for chainguard-source";
    homepage = "https://github.com/TODO/chainguard-source";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
