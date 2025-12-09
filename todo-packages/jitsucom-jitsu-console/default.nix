{ lib, stdenv, fetchFromGitHub, ... }:

# Package: jitsucom-jitsu-console
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "jitsucom-jitsu-console";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "jitsucom-jitsu-console";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for jitsucom-jitsu-console";
    homepage = "https://github.com/TODO/jitsucom-jitsu-console";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
