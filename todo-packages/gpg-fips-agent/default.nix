{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gpg-fips-agent
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gpg-fips-agent";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gpg-fips-agent";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gpg-fips-agent";
    homepage = "https://github.com/TODO/gpg-fips-agent";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
