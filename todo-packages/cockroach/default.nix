{ lib, stdenv, fetchFromGitHub, ... }:

# Package: cockroach-25.3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "cockroach";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "cockroach";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for cockroach";
    homepage = "https://github.com/TODO/cockroach";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
