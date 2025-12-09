{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dstat
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dstat";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dstat";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dstat";
    homepage = "https://github.com/TODO/dstat";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
