{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openssh-keyscan
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openssh-keyscan";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openssh-keyscan";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openssh-keyscan";
    homepage = "https://github.com/TODO/openssh-keyscan";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
