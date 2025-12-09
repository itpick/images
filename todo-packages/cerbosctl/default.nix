{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cerbosctl
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cerbosctl";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cerbosctl";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cerbosctl";
    homepage = "https://github.com/TODO/cerbosctl";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
