{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sigstore-scaffolding-fips-fulcio-createcerts
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sigstore-scaffolding-fips-fulcio-createcerts";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sigstore-scaffolding-fips-fulcio-createcerts";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sigstore-scaffolding-fips-fulcio-createcerts";
    homepage = "https://github.com/TODO/sigstore-scaffolding-fips-fulcio-createcerts";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
