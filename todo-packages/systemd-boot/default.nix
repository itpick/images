{ lib, stdenv, fetchFromGitHub, ... }:

# Package: systemd-boot
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "systemd-boot";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "systemd-boot";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for systemd-boot";
    homepage = "https://github.com/TODO/systemd-boot";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
