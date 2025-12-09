{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sigstore-scaffolding-cloudsqlproxy
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sigstore-scaffolding-cloudsqlproxy";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sigstore-scaffolding-cloudsqlproxy";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sigstore-scaffolding-cloudsqlproxy";
    homepage = "https://github.com/TODO/sigstore-scaffolding-cloudsqlproxy";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
