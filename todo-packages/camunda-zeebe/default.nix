{ lib, stdenv, fetchFromGitHub, ... }:

# Package: camunda-zeebe-8.8
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "camunda-zeebe";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "camunda-zeebe";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for camunda-zeebe";
    homepage = "https://github.com/TODO/camunda-zeebe";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
