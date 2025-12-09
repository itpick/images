{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-kubectl image
{
  name = "gitlab-kubectl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-kubectl"
    exit 1
  '';
}
