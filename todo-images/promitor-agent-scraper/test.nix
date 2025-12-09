{ pkgs, lib, ... }:

# TODO: Add tests for promitor-agent-scraper image
{
  name = "promitor-agent-scraper";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for promitor-agent-scraper"
    exit 1
  '';
}
