{ pkgs, lib, ... }:

# TODO: Add tests for pgadmin4 image
{
  name = "pgadmin4";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pgadmin4"
    exit 1
  '';
}
