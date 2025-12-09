{ pkgs, lib, ... }:

# TODO: Add tests for liberica-jre image
{
  name = "liberica-jre";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for liberica-jre"
    exit 1
  '';
}
