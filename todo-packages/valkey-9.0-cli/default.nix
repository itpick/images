{ lib, stdenv, fetchFromGitHub, ... }:

# Package: valkey-9.0-cli
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "valkey-9.0-cli";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "valkey-9.0-cli";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for valkey-9.0-cli";
    homepage = "https://github.com/TODO/valkey-9.0-cli";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
