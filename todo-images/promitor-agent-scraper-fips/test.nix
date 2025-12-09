{ pkgs, lib, ... }:

# TODO: Add tests for promitor-agent-scraper-fips image
{
  name = "promitor-agent-scraper-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for promitor-agent-scraper-fips"
    exit 1
  '';
}
