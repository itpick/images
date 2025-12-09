{ lib, stdenv, fetchFromGitHub, ... }:

# Package: corretto-bcfips-policy-140-3-j21
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "corretto-bcfips-policy-140-3-j21";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "corretto-bcfips-policy-140-3-j21";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for corretto-bcfips-policy-140-3-j21";
    homepage = "https://github.com/TODO/corretto-bcfips-policy-140-3-j21";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
