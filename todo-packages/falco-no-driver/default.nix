{ lib, stdenv, fetchFromGitHub, ... }:

# Package: falco-no-driver
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "falco-no-driver";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "falco-no-driver";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for falco-no-driver";
    homepage = "https://github.com/TODO/falco-no-driver";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
