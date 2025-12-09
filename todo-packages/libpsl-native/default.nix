{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libpsl-native
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libpsl-native";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libpsl-native";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libpsl-native";
    homepage = "https://github.com/TODO/libpsl-native";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
