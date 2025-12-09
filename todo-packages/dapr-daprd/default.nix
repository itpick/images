{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dapr-daprd-1.15
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dapr-daprd";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dapr-daprd";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dapr-daprd";
    homepage = "https://github.com/TODO/dapr-daprd";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
