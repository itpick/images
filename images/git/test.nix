{ pkgs, image }:

pkgs.writeShellScript "test-git" ''
  set -euo pipefail
  
  echo "🧪 Testing git image functionality..."
  
  # Test 1: Git version
  echo "  ✓ Testing git version..."
  docker run --rm ${image.imageName}:test git --version | grep -q "git version"
  
  # Test 2: Git configuration
  echo "  ✓ Testing git configuration..."
  docker run --rm ${image.imageName}:test git config --global user.name "Test User"
  docker run --rm ${image.imageName}:test git config --global user.email "test@example.com"
  
  # Test 3: Repository operations
  echo "  ✓ Testing repository operations..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace && 
    rm -rf test-repo && 
    git init test-repo && 
    cd test-repo && 
    echo "test" > README.md && 
    git add README.md && 
    git config user.name "Test" && 
    git config user.email "test@example.com" && 
    git commit -m "Initial commit"
  '
  
  # Test 4: SSH availability
  echo "  ✓ Testing SSH availability..."
  docker run --rm ${image.imageName}:test which ssh | grep -q "ssh"
  
  # Test 5: GPG availability  
  echo "  ✓ Testing GPG availability..."
  docker run --rm ${image.imageName}:test which gpg | grep -q "gpg"
  
  echo "✅ All git tests passed!"
''