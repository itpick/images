{ lib, stdenv, fetchFromGitHub, ... }:

# Package: go-openssl-1.23
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "go-openssl";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "go-openssl";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for go-openssl";
    homepage = "https://github.com/TODO/go-openssl";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
