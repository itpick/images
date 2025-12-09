{ lib, stdenv, fetchFromGitHub, ... }:

# Package: buildctl-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "buildctl-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "buildctl-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for buildctl-fips";
    homepage = "https://github.com/TODO/buildctl-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
