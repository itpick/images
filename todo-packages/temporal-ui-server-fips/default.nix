{ lib, stdenv, fetchFromGitHub, ... }:

# Package: temporal-ui-server-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "temporal-ui-server-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "temporal-ui-server-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for temporal-ui-server-fips";
    homepage = "https://github.com/TODO/temporal-ui-server-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
