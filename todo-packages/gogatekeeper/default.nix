{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gogatekeeper
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gogatekeeper";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gogatekeeper";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gogatekeeper";
    homepage = "https://github.com/TODO/gogatekeeper";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
