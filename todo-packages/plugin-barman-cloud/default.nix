{ lib, stdenv, fetchFromGitHub, ... }:

# Package: plugin-barman-cloud
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "plugin-barman-cloud";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "plugin-barman-cloud";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for plugin-barman-cloud";
    homepage = "https://github.com/TODO/plugin-barman-cloud";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
