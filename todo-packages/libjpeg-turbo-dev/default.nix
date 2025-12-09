{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libjpeg-turbo-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libjpeg-turbo-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libjpeg-turbo-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libjpeg-turbo-dev";
    homepage = "https://github.com/TODO/libjpeg-turbo-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
