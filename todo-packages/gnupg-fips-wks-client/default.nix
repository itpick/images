{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gnupg-fips-wks-client
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gnupg-fips-wks-client";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gnupg-fips-wks-client";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gnupg-fips-wks-client";
    homepage = "https://github.com/TODO/gnupg-fips-wks-client";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
