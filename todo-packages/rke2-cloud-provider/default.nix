{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rke2-cloud-provider
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rke2-cloud-provider";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rke2-cloud-provider";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rke2-cloud-provider";
    homepage = "https://github.com/TODO/rke2-cloud-provider";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
