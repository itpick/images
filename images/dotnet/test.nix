{ pkgs, image }:

pkgs.writeShellScript "test-dotnet" ''
  set -euo pipefail
  
  echo "🧪 Testing dotnet image functionality..."
  
  # Test 1: .NET version
  echo "  ✓ Testing dotnet version..."
  docker run --rm ${image.imageName}:test dotnet --version | grep -q "[0-9]\+\.[0-9]"
  
  # Test 2: .NET info
  echo "  ✓ Testing dotnet info..."
  docker run --rm ${image.imageName}:test dotnet --info | grep -q "Microsoft.NETCore.App"
  
  # Test 3: Project creation and build
  echo "  ✓ Testing project creation..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    rm -rf dotnet-test &&
    dotnet new console -n dotnet-test &&
    cd dotnet-test &&
    echo "Console.WriteLine(\"Hello from .NET\");" > Program.cs &&
    dotnet build
  '
  
  # Test 4: Runtime list
  echo "  ✓ Testing runtime list..."
  docker run --rm ${image.imageName}:test dotnet --list-runtimes | grep -q "Microsoft.NETCore.App"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All dotnet tests passed!"
''