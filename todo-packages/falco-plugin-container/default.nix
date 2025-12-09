{ lib, stdenv, fetchFromGitHub, ... }:

# Package: falco-plugin-container
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "falco-plugin-container";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "falco-plugin-container";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for falco-plugin-container";
    homepage = "https://github.com/TODO/falco-plugin-container";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
