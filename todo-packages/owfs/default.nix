{ lib, stdenv, fetchFromGitHub, ... }:

# Package: owfs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "owfs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "owfs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for owfs";
    homepage = "https://github.com/TODO/owfs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
