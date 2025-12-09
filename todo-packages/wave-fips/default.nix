{ lib, stdenv, fetchFromGitHub, ... }:

# Package: wave-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "wave-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "wave-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for wave-fips";
    homepage = "https://github.com/TODO/wave-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
