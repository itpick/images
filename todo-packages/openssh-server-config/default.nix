{ lib, stdenv, fetchFromGitHub, ... }:

# Package: openssh-server-config
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "openssh-server-config";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "openssh-server-config";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for openssh-server-config";
    homepage = "https://github.com/TODO/openssh-server-config";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
