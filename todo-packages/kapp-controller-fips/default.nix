{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kapp-controller-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kapp-controller-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kapp-controller-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kapp-controller-fips";
    homepage = "https://github.com/TODO/kapp-controller-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
