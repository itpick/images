{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libbpf-dev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libbpf-dev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libbpf-dev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libbpf-dev";
    homepage = "https://github.com/TODO/libbpf-dev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
