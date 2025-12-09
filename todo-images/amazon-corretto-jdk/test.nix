{ pkgs, lib, ... }:

# TODO: Add tests for amazon-corretto-jdk image
{
  name = "amazon-corretto-jdk";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for amazon-corretto-jdk"
    exit 1
  '';
}
