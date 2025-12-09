{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sigstore-scaffolding-tsa-createcertchain
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sigstore-scaffolding-tsa-createcertchain";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sigstore-scaffolding-tsa-createcertchain";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sigstore-scaffolding-tsa-createcertchain";
    homepage = "https://github.com/TODO/sigstore-scaffolding-tsa-createcertchain";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
