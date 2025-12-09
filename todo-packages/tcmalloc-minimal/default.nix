{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tcmalloc-minimal
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tcmalloc-minimal";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tcmalloc-minimal";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tcmalloc-minimal";
    homepage = "https://github.com/TODO/tcmalloc-minimal";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
