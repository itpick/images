{ lib, stdenv, fetchFromGitHub, ... }:

# Package: policy-controller
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "policy-controller";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "policy-controller";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for policy-controller";
    homepage = "https://github.com/TODO/policy-controller";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
