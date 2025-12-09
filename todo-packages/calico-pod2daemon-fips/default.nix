{ lib, stdenv, fetchFromGitHub, ... }:

# Package: calico-pod2daemon-fips-3.31
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "calico-pod2daemon-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "calico-pod2daemon-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for calico-pod2daemon-fips";
    homepage = "https://github.com/TODO/calico-pod2daemon-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
