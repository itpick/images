{ lib, stdenv, fetchFromGitHub, ... }:

# Package: rsyslog-uxsock
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "rsyslog-uxsock";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "rsyslog-uxsock";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for rsyslog-uxsock";
    homepage = "https://github.com/TODO/rsyslog-uxsock";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
