{ lib, stdenv, fetchFromGitHub, ... }:

# Package: k3s-static
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "k3s-static";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "k3s-static";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for k3s-static";
    homepage = "https://github.com/TODO/k3s-static";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
