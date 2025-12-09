{ lib, stdenv, fetchFromGitHub, ... }:

# Package: thanos-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "thanos-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "thanos-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for thanos-fips";
    homepage = "https://github.com/TODO/thanos-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
