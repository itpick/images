{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libnotify-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libnotify-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libnotify-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libnotify-dev";
    homepage = "https://github.com/TODO/libnotify-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
