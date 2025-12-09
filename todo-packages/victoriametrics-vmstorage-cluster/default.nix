{ lib, stdenv, fetchFromGitHub, ... }:

# Package: victoriametrics-vmstorage-cluster
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "victoriametrics-vmstorage-cluster";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "victoriametrics-vmstorage-cluster";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for victoriametrics-vmstorage-cluster";
    homepage = "https://github.com/TODO/victoriametrics-vmstorage-cluster";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
