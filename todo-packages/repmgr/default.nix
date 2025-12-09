{ lib, stdenv, fetchFromGitHub, ... }:

# Package: repmgr-18
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "repmgr";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "repmgr";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for repmgr";
    homepage = "https://github.com/TODO/repmgr";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
