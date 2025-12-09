{ pkgs, lib, ... }:

# TODO: Add tests for elixir image
{
  name = "elixir";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for elixir"
    exit 1
  '';
}
