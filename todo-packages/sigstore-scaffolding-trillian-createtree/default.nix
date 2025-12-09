{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sigstore-scaffolding-trillian-createtree
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sigstore-scaffolding-trillian-createtree";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sigstore-scaffolding-trillian-createtree";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sigstore-scaffolding-trillian-createtree";
    homepage = "https://github.com/TODO/sigstore-scaffolding-trillian-createtree";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
