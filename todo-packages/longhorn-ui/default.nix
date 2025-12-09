{ lib, stdenv, fetchFromGitHub, ... }:

# Package: longhorn-ui-1.10
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "longhorn-ui";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "longhorn-ui";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for longhorn-ui";
    homepage = "https://github.com/TODO/longhorn-ui";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
