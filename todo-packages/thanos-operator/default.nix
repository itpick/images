{ lib, stdenv, fetchFromGitHub, ... }:

# Package: thanos-operator
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "thanos-operator";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "thanos-operator";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for thanos-operator";
    homepage = "https://github.com/TODO/thanos-operator";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
