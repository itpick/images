{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ctr-2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ctr";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ctr";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ctr";
    homepage = "https://github.com/TODO/ctr";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
