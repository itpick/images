{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sigstore-scaffolding-fips-trillian-createtree
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sigstore-scaffolding-fips-trillian-createtree";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sigstore-scaffolding-fips-trillian-createtree";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sigstore-scaffolding-fips-trillian-createtree";
    homepage = "https://github.com/TODO/sigstore-scaffolding-fips-trillian-createtree";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
