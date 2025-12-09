{ lib, stdenv, fetchFromGitHub, ... }:

# Package: k9s-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "k9s-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "k9s-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for k9s-fips";
    homepage = "https://github.com/TODO/k9s-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
