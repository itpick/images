{ lib, stdenv, fetchFromGitHub, ... }:

# Package: terraform-provider-azurerm
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "terraform-provider-azurerm";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "terraform-provider-azurerm";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for terraform-provider-azurerm";
    homepage = "https://github.com/TODO/terraform-provider-azurerm";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
