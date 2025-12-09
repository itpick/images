{ lib, stdenv, fetchFromGitHub, ... }:

# Package: katib-earlystopping
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "katib-earlystopping";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "katib-earlystopping";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for katib-earlystopping";
    homepage = "https://github.com/TODO/katib-earlystopping";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
