{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openssl-provider-legacy
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openssl-provider-legacy";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openssl-provider-legacy";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openssl-provider-legacy";
    homepage = "https://github.com/TODO/openssl-provider-legacy";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
