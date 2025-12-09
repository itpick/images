{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sigstore-scaffolding-fips-cloudsqlproxy
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sigstore-scaffolding-fips-cloudsqlproxy";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sigstore-scaffolding-fips-cloudsqlproxy";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sigstore-scaffolding-fips-cloudsqlproxy";
    homepage = "https://github.com/TODO/sigstore-scaffolding-fips-cloudsqlproxy";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
