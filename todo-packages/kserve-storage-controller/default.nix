{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kserve-storage-controller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kserve-storage-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kserve-storage-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kserve-storage-controller";
    homepage = "https://github.com/TODO/kserve-storage-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
