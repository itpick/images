{ pkgs, lib, ... }:

# TODO: Add tests for liberica-jdk image
{
  name = "liberica-jdk";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for liberica-jdk"
    exit 1
  '';
}
