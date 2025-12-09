{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libsepol-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libsepol-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libsepol-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libsepol-dev";
    homepage = "https://github.com/TODO/libsepol-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
