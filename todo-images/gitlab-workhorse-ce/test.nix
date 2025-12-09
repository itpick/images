{ pkgs, lib, ... }:

# TODO: Add tests for gitlab-workhorse-ce image
{
  name = "gitlab-workhorse-ce";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gitlab-workhorse-ce"
    exit 1
  '';
}
