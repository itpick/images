{ lib, stdenv, fetchFromGitHub, ... }:

# Package: nghttp3-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "nghttp3-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "nghttp3-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for nghttp3-dev";
    homepage = "https://github.com/TODO/nghttp3-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
