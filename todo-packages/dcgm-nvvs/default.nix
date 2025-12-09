{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dcgm-nvvs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dcgm-nvvs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dcgm-nvvs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dcgm-nvvs";
    homepage = "https://github.com/TODO/dcgm-nvvs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
