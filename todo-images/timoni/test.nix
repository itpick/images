{ pkgs, lib, ... }:

# TODO: Add tests for timoni image
{
  name = "timoni";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for timoni"
    exit 1
  '';
}
