{ lib, stdenv, fetchFromGitHub, ... }:

# Package: liblapacke
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "liblapacke";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "liblapacke";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for liblapacke";
    homepage = "https://github.com/TODO/liblapacke";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
