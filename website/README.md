# Nix Containers Website

A dynamic website that displays all container images with comprehensive metadata, README content, and build information.

## Features

- **Dynamic Image Discovery**: Automatically discovers all images using Nix flake evaluation
- **README Integration**: Displays README content from each image directory
- **Nix Code Analysis**: Extracts metadata from default.nix files including labels and configuration
- **Docker Integration**: Shows image sizes, build dates, and available tags
- **Interactive Search**: Filter by name, description, category, or aliases
- **Copy-to-Clipboard**: Easy copying of pull commands
- **Responsive Design**: Works on desktop and mobile devices

## Quick Start

### Development

```bash
# Enter development environment
nix develop .#website-dev

# Navigate to website directory
cd website

# Install dependencies and start development server
npm install
npm run dev

# Visit http://localhost:3000
```

### Production Build

```bash
# Build website package
nix build .#website

# Run production server
./result/server.js
```

### Update Image Data

```bash
# Refresh image metadata cache
cd website
node scripts/update-image-data.js
```

## Architecture

- **Backend**: Node.js/Express server
- **Frontend**: Vanilla JavaScript with Tailwind CSS
- **Data Sources**:
  - README.md files from each image directory
  - default.nix files for metadata extraction
  - Nix flake evaluation for image discovery
  - Docker inspection for build information

## API Endpoints

- `GET /api/images` - List all images with metadata
- `GET /api/images/:name` - Get detailed info for specific image
- `GET /api/images/:name/readme` - Get README content for image

## Features

### Dynamic Content
- Automatically reads README.md files from image directories
- Parses Nix configuration for labels and metadata
- Inspects Docker images for size and build information

### Search and Filtering
- Search by image name, description, or aliases
- Filter by category (runtime, build-env, database, etc.)
- Real-time filtering without page reload

### Image Details
- Comprehensive metadata display
- Version information and available tags
- Build dates and compressed sizes
- Copy-to-clipboard pull commands
- Links to upstream projects