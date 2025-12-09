{ lib, stdenv, fetchFromGitHub, ... }:

# Package: esbuild-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "esbuild-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "esbuild-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for esbuild-fips";
    homepage = "https://github.com/TODO/esbuild-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
