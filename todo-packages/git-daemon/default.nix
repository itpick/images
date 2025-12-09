{ lib, stdenv, fetchFromGitHub, ... }:

# Package: git-daemon
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "git-daemon";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "git-daemon";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for git-daemon";
    homepage = "https://github.com/TODO/git-daemon";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
