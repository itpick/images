{ lib, stdenv, fetchFromGitHub, ... }:

# Package: knative-eventing-fips-1.19-channel-dispatcher
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "knative-eventing-fips-1.19-channel-dispatcher";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "knative-eventing-fips-1.19-channel-dispatcher";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for knative-eventing-fips-1.19-channel-dispatcher";
    homepage = "https://github.com/TODO/knative-eventing-fips-1.19-channel-dispatcher";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
