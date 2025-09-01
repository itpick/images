{ pkgs, image }:

pkgs.writeShellScript "test-aspnet-runtime" ''
  set -euo pipefail
  
  echo "🧪 Testing aspnet-runtime image functionality..."
  
  # Test 1: .NET runtime version
  echo "  ✓ Testing dotnet runtime version..."
  docker run --rm ${image.imageName}:test dotnet --version | grep -q "[0-9]\+\.[0-9]"
  
  # Test 2: ASP.NET runtime info
  echo "  ✓ Testing ASP.NET runtime info..."
  docker run --rm ${image.imageName}:test dotnet --info | grep -q "Microsoft.AspNetCore.App"
  
  # Test 3: Runtime libraries
  echo "  ✓ Testing runtime libraries..."
  docker run --rm ${image.imageName}:test dotnet --list-runtimes | grep -q "Microsoft.AspNetCore.App"
  
  # Test 4: Help functionality
  echo "  ✓ Testing help functionality..."
  docker run --rm ${image.imageName}:test dotnet --help | grep -q "Usage"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All aspnet-runtime tests passed!"
''