{ pkgs, lib, ... }:

# TODO: Add tests for apache-kvrocks image
{
  name = "apache-kvrocks";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for apache-kvrocks"
    exit 1
  '';
}
