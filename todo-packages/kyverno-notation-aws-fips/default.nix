{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kyverno-notation-aws-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kyverno-notation-aws-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kyverno-notation-aws-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kyverno-notation-aws-fips";
    homepage = "https://github.com/TODO/kyverno-notation-aws-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
