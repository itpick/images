{ lib, stdenv, fetchFromGitHub, ... }:

# Package: image-factory
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "image-factory";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "image-factory";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for image-factory";
    homepage = "https://github.com/TODO/image-factory";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
