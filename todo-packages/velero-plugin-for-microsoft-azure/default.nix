{ lib, stdenv, fetchFromGitHub, ... }:

# Package: velero-plugin-for-microsoft-azure
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "velero-plugin-for-microsoft-azure";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "velero-plugin-for-microsoft-azure";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for velero-plugin-for-microsoft-azure";
    homepage = "https://github.com/TODO/velero-plugin-for-microsoft-azure";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
