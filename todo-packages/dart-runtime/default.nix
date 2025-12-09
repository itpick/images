{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dart-runtime
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dart-runtime";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dart-runtime";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dart-runtime";
    homepage = "https://github.com/TODO/dart-runtime";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
