{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tensorflow-gpu-jupyter
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tensorflow-gpu-jupyter";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tensorflow-gpu-jupyter";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tensorflow-gpu-jupyter";
    homepage = "https://github.com/TODO/tensorflow-gpu-jupyter";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
