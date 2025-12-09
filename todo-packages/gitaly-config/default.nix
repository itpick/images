{ lib, stdenv, fetchFromGitHub, ... }:

# Package: gitaly-config-18.6
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "gitaly-config";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "gitaly-config";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for gitaly-config";
    homepage = "https://github.com/TODO/gitaly-config";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
