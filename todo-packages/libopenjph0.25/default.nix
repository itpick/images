{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libopenjph0.25
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libopenjph0.25";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libopenjph0.25";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libopenjph0.25";
    homepage = "https://github.com/TODO/libopenjph0.25";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
