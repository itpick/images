{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openssh-server
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openssh-server";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openssh-server";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openssh-server";
    homepage = "https://github.com/TODO/openssh-server";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
