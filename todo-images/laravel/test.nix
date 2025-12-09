{ pkgs, lib, ... }:

# TODO: Add tests for laravel image
{
  name = "laravel";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for laravel"
    exit 1
  '';
}
