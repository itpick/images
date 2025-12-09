{ lib, stdenv, fetchFromGitHub, ... }:

# Package: calico-whisker-fips-3.31
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "calico-whisker-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "calico-whisker-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for calico-whisker-fips";
    homepage = "https://github.com/TODO/calico-whisker-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
