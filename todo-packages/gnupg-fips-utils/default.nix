{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gnupg-fips-utils
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gnupg-fips-utils";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gnupg-fips-utils";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gnupg-fips-utils";
    homepage = "https://github.com/TODO/gnupg-fips-utils";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
