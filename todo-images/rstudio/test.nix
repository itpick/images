{ pkgs, lib, ... }:

# TODO: Add tests for rstudio image
{
  name = "rstudio";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rstudio"
    exit 1
  '';
}
