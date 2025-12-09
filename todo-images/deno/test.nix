{ pkgs, lib, ... }:

# TODO: Add tests for deno image
{
  name = "deno";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for deno"
    exit 1
  '';
}
