{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libnss-tools
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libnss-tools";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libnss-tools";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libnss-tools";
    homepage = "https://github.com/TODO/libnss-tools";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
