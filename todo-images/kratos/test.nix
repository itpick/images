{ pkgs, lib, ... }:

# TODO: Add tests for kratos image
{
  name = "kratos";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kratos"
    exit 1
  '';
}
