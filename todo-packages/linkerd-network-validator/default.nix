{ lib, stdenv, fetchFromGitHub, ... }:

# Package: linkerd-network-validator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "linkerd-network-validator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "linkerd-network-validator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for linkerd-network-validator";
    homepage = "https://github.com/TODO/linkerd-network-validator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
