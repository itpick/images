{ lib, stdenv, fetchFromGitHub, ... }:

# Package: whereabouts
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "whereabouts";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "whereabouts";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for whereabouts";
    homepage = "https://github.com/TODO/whereabouts";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
