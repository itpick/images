{ lib, stdenv, fetchFromGitHub, ... }:

# Package: fulcio-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "fulcio-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "fulcio-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for fulcio-fips";
    homepage = "https://github.com/TODO/fulcio-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
