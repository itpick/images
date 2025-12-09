{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rclone-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rclone-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rclone-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rclone-fips";
    homepage = "https://github.com/TODO/rclone-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
