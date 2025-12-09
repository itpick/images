{ pkgs, lib, ... }:

# TODO: Add tests for mdbook image
{
  name = "mdbook";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mdbook"
    exit 1
  '';
}
