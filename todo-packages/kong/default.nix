{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kong
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kong";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kong";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kong";
    homepage = "https://github.com/TODO/kong";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
