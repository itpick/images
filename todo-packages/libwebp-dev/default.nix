{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libwebp-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libwebp-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libwebp-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libwebp-dev";
    homepage = "https://github.com/TODO/libwebp-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
