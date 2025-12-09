{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rekor-fips-cli
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rekor-fips-cli";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rekor-fips-cli";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rekor-fips-cli";
    homepage = "https://github.com/TODO/rekor-fips-cli";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
