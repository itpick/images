{ lib, stdenv, fetchFromGitHub, ... }:

# Package: crictl
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "crictl";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "crictl";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for crictl";
    homepage = "https://github.com/TODO/crictl";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
