{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ca-certificates
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ca-certificates";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ca-certificates";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ca-certificates";
    homepage = "https://github.com/TODO/ca-certificates";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
