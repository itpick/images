{ lib, stdenv, fetchFromGitHub, ... }:

# Package: addon-resizer
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "addon-resizer";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "addon-resizer";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for addon-resizer";
    homepage = "https://github.com/TODO/addon-resizer";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
