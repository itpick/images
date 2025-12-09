{ lib, stdenv, fetchFromGitHub, ... }:

# Package: ratify-sbom
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "ratify-sbom";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "ratify-sbom";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for ratify-sbom";
    homepage = "https://github.com/TODO/ratify-sbom";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
