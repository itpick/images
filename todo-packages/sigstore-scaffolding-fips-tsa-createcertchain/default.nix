{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sigstore-scaffolding-fips-tsa-createcertchain
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sigstore-scaffolding-fips-tsa-createcertchain";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sigstore-scaffolding-fips-tsa-createcertchain";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sigstore-scaffolding-fips-tsa-createcertchain";
    homepage = "https://github.com/TODO/sigstore-scaffolding-fips-tsa-createcertchain";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
