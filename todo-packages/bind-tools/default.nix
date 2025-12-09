{ lib, stdenv, fetchFromGitHub, ... }:

# Package: bind-tools
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "bind-tools";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "bind-tools";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for bind-tools";
    homepage = "https://github.com/TODO/bind-tools";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
