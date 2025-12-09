{ lib, stdenv, fetchFromGitHub, ... }:

# Package: p11-kit-trust
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "p11-kit-trust";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "p11-kit-trust";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for p11-kit-trust";
    homepage = "https://github.com/TODO/p11-kit-trust";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
