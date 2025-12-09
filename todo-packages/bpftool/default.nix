{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bpftool
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bpftool";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bpftool";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bpftool";
    homepage = "https://github.com/TODO/bpftool";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
