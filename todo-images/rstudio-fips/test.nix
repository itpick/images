{ pkgs, lib, ... }:

# TODO: Add tests for rstudio-fips image
{
  name = "rstudio-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rstudio-fips"
    exit 1
  '';
}
