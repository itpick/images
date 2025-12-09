{ lib, stdenv, fetchFromGitHub, ... }:

# Package: dapr-scheduler-1.15
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "dapr-scheduler";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "dapr-scheduler";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for dapr-scheduler";
    homepage = "https://github.com/TODO/dapr-scheduler";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
