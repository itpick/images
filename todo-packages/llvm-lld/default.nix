{ lib, stdenv, fetchFromGitHub, ... }:

# Package: llvm-lld-19
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "llvm-lld";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "llvm-lld";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for llvm-lld";
    homepage = "https://github.com/TODO/llvm-lld";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
