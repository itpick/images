{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cilium-certgen-0.2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cilium-certgen";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cilium-certgen";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cilium-certgen";
    homepage = "https://github.com/TODO/cilium-certgen";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
