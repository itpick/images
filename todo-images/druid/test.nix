{ pkgs, lib, ... }:

# TODO: Add tests for druid image
{
  name = "druid";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for druid"
    exit 1
  '';
}
