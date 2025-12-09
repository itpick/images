{ pkgs, lib, ... }:

# TODO: Add tests for harbor-redis image
{
  name = "harbor-redis";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for harbor-redis"
    exit 1
  '';
}
