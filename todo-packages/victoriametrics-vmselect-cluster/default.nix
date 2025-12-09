{ lib, stdenv, fetchFromGitHub, ... }:

# Package: victoriametrics-vmselect-cluster
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "victoriametrics-vmselect-cluster";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "victoriametrics-vmselect-cluster";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for victoriametrics-vmselect-cluster";
    homepage = "https://github.com/TODO/victoriametrics-vmselect-cluster";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
