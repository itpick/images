{ pkgs, lib, ... }:

# TODO: Add tests for adoptium-jdk image
{
  name = "adoptium-jdk";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for adoptium-jdk"
    exit 1
  '';
}
