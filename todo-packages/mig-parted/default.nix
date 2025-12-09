{ lib, stdenv, fetchFromGitHub, ... }:

# Package: mig-parted
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "mig-parted";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "mig-parted";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for mig-parted";
    homepage = "https://github.com/TODO/mig-parted";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
