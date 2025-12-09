{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openssh-keygen
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openssh-keygen";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openssh-keygen";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openssh-keygen";
    homepage = "https://github.com/TODO/openssh-keygen";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
