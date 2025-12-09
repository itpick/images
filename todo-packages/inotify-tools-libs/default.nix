{ lib, stdenv, fetchFromGitHub, ... }:

# Package: inotify-tools-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "inotify-tools-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "inotify-tools-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for inotify-tools-libs";
    homepage = "https://github.com/TODO/inotify-tools-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
