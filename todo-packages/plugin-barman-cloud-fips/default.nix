{ lib, stdenv, fetchFromGitHub, ... }:

# Package: plugin-barman-cloud-fips
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "plugin-barman-cloud-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "plugin-barman-cloud-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for plugin-barman-cloud-fips";
    homepage = "https://github.com/TODO/plugin-barman-cloud-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
