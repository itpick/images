const express = require('express');
const fs = require('fs-extra');
const path = require('path');
const marked = require('marked');
const { execSync } = require('child_process');
const moment = require('moment');

const app = express();
const PORT = process.env.PORT || 3000;

// Serve static files
app.use(express.static('public'));

// Get all image directories
function getImageDirectories() {
  const imagesPath = path.join(__dirname, '..', 'images');
  return fs.readdirSync(imagesPath)
    .filter(item => {
      const itemPath = path.join(imagesPath, item);
      return fs.statSync(itemPath).isDirectory() && 
             fs.existsSync(path.join(itemPath, 'default.nix'));
    })
    .sort();
}

// Read README content for an image
function getImageReadme(imageName) {
  const readmePath = path.join(__dirname, '..', 'images', imageName, 'README.md');
  if (fs.existsSync(readmePath)) {
    const content = fs.readFileSync(readmePath, 'utf8');
    return marked.parse(content);
  }
  return '<p>No README available</p>';
}

// Extract metadata from default.nix
function getImageMetadata(imageName) {
  const nixPath = path.join(__dirname, '..', 'images', imageName, 'default.nix');
  if (!fs.existsSync(nixPath)) return {};
  
  const content = fs.readFileSync(nixPath, 'utf8');
  
  // Extract labels and other metadata
  const metadata = {
    name: imageName,
    hasTest: fs.existsSync(path.join(__dirname, '..', 'images', imageName, 'test.nix')),
    category: 'unknown',
    description: '',
    upstream: '',
    aliases: '',
    version: 'latest'
  };
  
  // Parse labels from Nix code
  const labelMatch = content.match(/Labels\s*=\s*base\.defaultLabels\s*\/\/\s*{([^}]+)}/s);
  if (labelMatch) {
    const labelsContent = labelMatch[1];
    
    // Extract specific label values
    const descMatch = labelsContent.match(/"org\.opencontainers\.image\.description"\s*=\s*"([^"]+)"/);
    if (descMatch) metadata.description = descMatch[1];
    
    const versionMatch = labelsContent.match(/"org\.opencontainers\.image\.version"\s*=\s*(?:pkgs\.[\w.]+\.version|"([^"]+)")/);
    if (versionMatch) metadata.version = versionMatch[1] || 'dynamic';
    
    const upstreamMatch = labelsContent.match(/"io\.nix-containers\.image\.upstream"\s*=\s*"([^"]+)"/);
    if (upstreamMatch) metadata.upstream = upstreamMatch[1];
    
    const categoryMatch = labelsContent.match(/"io\.nix-containers\.image\.category"\s*=\s*"([^"]+)"/);
    if (categoryMatch) metadata.category = categoryMatch[1];
    
    const aliasMatch = labelsContent.match(/"io\.nix-containers\.image\.aliases"\s*=\s*"([^"]+)"/);
    if (aliasMatch) metadata.aliases = aliasMatch[1];
  }
  
  return metadata;
}

// Get image build info from Nix
function getImageBuildInfo(imageName) {
  try {
    // Get version from Nix evaluation
    const versionCmd = `cd ${path.join(__dirname, '..')} && nix eval --raw .#${imageName}.config.Labels.\\"org.opencontainers.image.version\\" 2>/dev/null || echo "latest"`;
    const version = execSync(versionCmd, { encoding: 'utf8' }).trim();
    
    return {
      version: version,
      buildDate: new Date().toISOString(), // Placeholder - would need actual build tracking
      tags: ['latest', version !== 'latest' ? version : null].filter(Boolean)
    };
  } catch (error) {
    return {
      version: 'latest',
      buildDate: 'unknown',
      tags: ['latest']
    };
  }
}

// Get Docker image size if available
function getImageSize(imageName) {
  try {
    // Check if image exists in Docker
    const sizeCmd = `docker images --format "table {{.Repository}}:{{.Tag}}\\t{{.Size}}" | grep "^${imageName}:" | head -1 | awk '{print $2}'`;
    const size = execSync(sizeCmd, { encoding: 'utf8' }).trim();
    return size || 'Not built';
  } catch (error) {
    return 'Not built';
  }
}

// API endpoints
app.get('/api/images', (req, res) => {
  const images = getImageDirectories().map(imageName => {
    const metadata = getImageMetadata(imageName);
    const buildInfo = getImageBuildInfo(imageName);
    const size = getImageSize(imageName);
    
    return {
      ...metadata,
      ...buildInfo,
      size: size,
      pullCommand: `docker pull ghcr.io/nix-containers/images/${imageName}:latest`
    };
  });
  
  res.json(images);
});

app.get('/api/images/:name', (req, res) => {
  const { name } = req.params;
  const metadata = getImageMetadata(name);
  const buildInfo = getImageBuildInfo(name);
  const readme = getImageReadme(name);
  const size = getImageSize(name);
  
  res.json({
    ...metadata,
    ...buildInfo,
    readme: readme,
    size: size,
    pullCommand: `docker pull ghcr.io/nix-containers/images/${name}:latest`
  });
});

app.get('/api/images/:name/readme', (req, res) => {
  const { name } = req.params;
  const readme = getImageReadme(name);
  res.json({ readme });
});

// Serve the main page
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(PORT, () => {
  console.log(`🚀 Nix Containers website running on http://localhost:${PORT}`);
});