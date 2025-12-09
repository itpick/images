{ lib, stdenv, fetchFromGitHub, ... }:

# Package: falcosidekick
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "falcosidekick";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "falcosidekick";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for falcosidekick";
    homepage = "https://github.com/TODO/falcosidekick";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
