{ lib, stdenv, fetchFromGitHub, ... }:

# Package: falco-rules
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "falco-rules";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "falco-rules";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for falco-rules";
    homepage = "https://github.com/TODO/falco-rules";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
