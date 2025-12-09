{ lib, stdenv, fetchFromGitHub, ... }:

# Package: foxx-cli
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "foxx-cli";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "foxx-cli";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for foxx-cli";
    homepage = "https://github.com/TODO/foxx-cli";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
