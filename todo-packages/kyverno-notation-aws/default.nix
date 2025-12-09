{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kyverno-notation-aws
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kyverno-notation-aws";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kyverno-notation-aws";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kyverno-notation-aws";
    homepage = "https://github.com/TODO/kyverno-notation-aws";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
