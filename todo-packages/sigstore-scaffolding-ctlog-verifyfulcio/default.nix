{ lib, stdenv, fetchFromGitHub, ... }:

# Package: sigstore-scaffolding-ctlog-verifyfulcio
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "sigstore-scaffolding-ctlog-verifyfulcio";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "sigstore-scaffolding-ctlog-verifyfulcio";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for sigstore-scaffolding-ctlog-verifyfulcio";
    homepage = "https://github.com/TODO/sigstore-scaffolding-ctlog-verifyfulcio";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
