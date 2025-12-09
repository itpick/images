{ lib, stdenv, fetchFromGitHub, ... }:

# Package: victoriametrics-vmalert-cluster
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "victoriametrics-vmalert-cluster";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "victoriametrics-vmalert-cluster";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for victoriametrics-vmalert-cluster";
    homepage = "https://github.com/TODO/victoriametrics-vmalert-cluster";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
