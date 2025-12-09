{ lib, stdenv, fetchFromGitHub, ... }:

# Package: livekit-egress
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "livekit-egress";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "livekit-egress";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for livekit-egress";
    homepage = "https://github.com/TODO/livekit-egress";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
