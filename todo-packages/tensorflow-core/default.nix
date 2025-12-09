{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tensorflow-core
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tensorflow-core";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tensorflow-core";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tensorflow-core";
    homepage = "https://github.com/TODO/tensorflow-core";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
