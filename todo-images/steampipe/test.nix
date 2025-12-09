{ pkgs, lib, ... }:

# TODO: Add tests for steampipe image
{
  name = "steampipe";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for steampipe"
    exit 1
  '';
}
