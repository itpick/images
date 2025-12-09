{ lib, stdenv, fetchFromGitHub, ... }:

# Package: jitsucom-jitsu
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "jitsucom-jitsu";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "jitsucom-jitsu";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for jitsucom-jitsu";
    homepage = "https://github.com/TODO/jitsucom-jitsu";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
