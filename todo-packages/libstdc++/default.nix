{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libstdc++
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libstdc++";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libstdc++";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libstdc++";
    homepage = "https://github.com/TODO/libstdc++";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
