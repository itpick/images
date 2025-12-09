{ lib, stdenv, fetchFromGitHub, ... }:

# Package: consul-k8s-1.7
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "consul-k8s";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "consul-k8s";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for consul-k8s";
    homepage = "https://github.com/TODO/consul-k8s";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
