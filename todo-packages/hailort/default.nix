{ lib, stdenv, fetchFromGitHub, ... }:

# Package: hailort
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "hailort";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "hailort";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for hailort";
    homepage = "https://github.com/TODO/hailort";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
