{ lib, stdenv, fetchFromGitHub, ... }:

# Package: terraform-fips-1.14
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "terraform-fips";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "terraform-fips";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for terraform-fips";
    homepage = "https://github.com/TODO/terraform-fips";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
