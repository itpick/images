{ lib, stdenv, fetchFromGitHub, ... }:

# Package: trillian-fips-logsigner
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "trillian-fips-logsigner";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "trillian-fips-logsigner";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for trillian-fips-logsigner";
    homepage = "https://github.com/TODO/trillian-fips-logsigner";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
