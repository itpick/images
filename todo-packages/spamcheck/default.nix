{ lib, stdenv, fetchFromGitHub, ... }:

# Package: spamcheck
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "spamcheck";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "spamcheck";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for spamcheck";
    homepage = "https://github.com/TODO/spamcheck";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
