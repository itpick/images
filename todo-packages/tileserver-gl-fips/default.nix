{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tileserver-gl-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tileserver-gl-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tileserver-gl-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tileserver-gl-fips";
    homepage = "https://github.com/TODO/tileserver-gl-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
