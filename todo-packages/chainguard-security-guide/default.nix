{ lib, stdenv, fetchFromGitHub, ... }:

# Package: chainguard-security-guide
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "chainguard-security-guide";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "chainguard-security-guide";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for chainguard-security-guide";
    homepage = "https://github.com/TODO/chainguard-security-guide";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
