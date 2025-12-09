{ lib, stdenv, fetchFromGitHub, ... }:

# Package: unbound-config
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "unbound-config";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "unbound-config";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for unbound-config";
    homepage = "https://github.com/TODO/unbound-config";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
