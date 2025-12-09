{ lib, stdenv, fetchFromGitHub, ... }:

# Package: barman-cloudnative-pg
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "barman-cloudnative-pg";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "barman-cloudnative-pg";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for barman-cloudnative-pg";
    homepage = "https://github.com/TODO/barman-cloudnative-pg";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
