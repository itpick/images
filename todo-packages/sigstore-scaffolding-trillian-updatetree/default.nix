{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sigstore-scaffolding-trillian-updatetree
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sigstore-scaffolding-trillian-updatetree";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sigstore-scaffolding-trillian-updatetree";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sigstore-scaffolding-trillian-updatetree";
    homepage = "https://github.com/TODO/sigstore-scaffolding-trillian-updatetree";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
