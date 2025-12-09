{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kiam
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kiam";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kiam";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kiam";
    homepage = "https://github.com/TODO/kiam";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
