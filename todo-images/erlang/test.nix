{ pkgs, lib, ... }:

# TODO: Add tests for erlang image
{
  name = "erlang";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for erlang"
    exit 1
  '';
}
