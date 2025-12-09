{ lib, stdenv, fetchFromGitHub, ... }:

# Package: metacontroller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "metacontroller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "metacontroller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for metacontroller";
    homepage = "https://github.com/TODO/metacontroller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
