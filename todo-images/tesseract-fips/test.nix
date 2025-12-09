{ pkgs, lib, ... }:

# TODO: Add tests for tesseract-fips image
{
  name = "tesseract-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tesseract-fips"
    exit 1
  '';
}
