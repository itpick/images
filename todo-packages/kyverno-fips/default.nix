{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kyverno-fips-1.16
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kyverno-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kyverno-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kyverno-fips";
    homepage = "https://github.com/TODO/kyverno-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
