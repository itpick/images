let allImages = [];
let filteredImages = [];

// Initialize the application
document.addEventListener('DOMContentLoaded', function() {
    loadImages();
    setupEventListeners();
});

function setupEventListeners() {
    // Search functionality
    document.getElementById('search').addEventListener('input', filterImages);
    document.getElementById('category-filter').addEventListener('change', filterImages);
    document.getElementById('sort-filter').addEventListener('change', sortAndRenderImages);
    
    // Modal functionality
    document.getElementById('close-modal').addEventListener('click', closeModal);
    document.getElementById('image-modal').addEventListener('click', function(e) {
        if (e.target === this) closeModal();
    });
}

async function loadImages() {
    try {
        const response = await fetch('./images-data.json');
        const data = await response.json();
        allImages = data.images;
        filteredImages = [...allImages];
        
        updateStats(data);
        populateFilters();
        renderImages();
    } catch (error) {
        console.error('Error loading images:', error);
        showError('Failed to load images. Please check the data file.');
    }
}

function updateStats(data) {
    document.getElementById('image-count').textContent = `${data.totalCount} images`;
    document.getElementById('total-images').textContent = data.totalCount;
    
    const testedCount = data.images.filter(img => img.hasTest).length;
    document.getElementById('tested-images').textContent = testedCount;
    
    const categories = new Set(data.images.map(img => img.category));
    document.getElementById('categories-count').textContent = categories.size;
    
    document.getElementById('latest-version').textContent = 'Nix + nix2container';
    
    if (data.lastUpdated) {
        const date = new Date(data.lastUpdated);
        document.getElementById('last-updated').textContent = `Updated: ${date.toLocaleDateString()}`;
    }
}

function populateFilters() {
    const categories = [...new Set(allImages.map(img => img.category))].sort();
    const categoryFilter = document.getElementById('category-filter');
    
    // Clear existing options (except "All Categories")
    while (categoryFilter.children.length > 1) {
        categoryFilter.removeChild(categoryFilter.lastChild);
    }
    
    // Add category options
    categories.forEach(category => {
        const option = document.createElement('option');
        option.value = category;
        option.textContent = category.charAt(0).toUpperCase() + category.slice(1).replace('-', ' ');
        categoryFilter.appendChild(option);
    });
}

function filterImages() {
    const search = document.getElementById('search').value.toLowerCase();
    const category = document.getElementById('category-filter').value;
    
    filteredImages = allImages.filter(image => {
        const matchesSearch = !search || 
            image.name.toLowerCase().includes(search) ||
            image.description.toLowerCase().includes(search) ||
            image.aliases.toLowerCase().includes(search);
        
        const matchesCategory = !category || image.category === category;
        
        return matchesSearch && matchesCategory;
    });
    
    sortAndRenderImages();
}

function sortAndRenderImages() {
    const sortBy = document.getElementById('sort-filter').value;
    
    filteredImages.sort((a, b) => {
        switch (sortBy) {
            case 'category':
                return a.category.localeCompare(b.category) || a.name.localeCompare(b.name);
            case 'size':
                // Handle size sorting (convert to bytes for proper sorting)
                const sizeA = parseSize(a.size || '0MB');
                const sizeB = parseSize(b.size || '0MB');
                return sizeB - sizeA; // Largest first
            default:
                return a.name.localeCompare(b.name);
        }
    });
    
    renderImages();
}

function parseSize(sizeStr) {
    if (!sizeStr || sizeStr === 'Not built') return 0;
    const match = sizeStr.match(/([0-9.]+)([KMGT]?B)/);
    if (!match) return 0;
    
    const value = parseFloat(match[1]);
    const unit = match[2];
    
    switch (unit) {
        case 'GB': return value * 1024 * 1024 * 1024;
        case 'MB': return value * 1024 * 1024;
        case 'KB': return value * 1024;
        default: return value;
    }
}

function formatSize(sizeValue) {
    if (!sizeValue || sizeValue === 'Not built' || sizeValue === 0) {
        return 'Not built';
    }
    
    // If it's already a formatted string, return it
    if (typeof sizeValue === 'string' && sizeValue.includes('B')) {
        return sizeValue;
    }
    
    // Convert bytes to human readable format
    const bytes = parseInt(sizeValue);
    if (isNaN(bytes)) return 'Not built';
    
    if (bytes >= 1024 * 1024 * 1024) {
        return `${(bytes / (1024 * 1024 * 1024)).toFixed(1)}GB`;
    } else if (bytes >= 1024 * 1024) {
        return `${(bytes / (1024 * 1024)).toFixed(1)}MB`;
    } else if (bytes >= 1024) {
        return `${(bytes / 1024).toFixed(1)}KB`;
    } else {
        return `${bytes}B`;
    }
}

function renderImages() {
    const container = document.getElementById('images-container');
    
    if (filteredImages.length === 0) {
        container.innerHTML = `
            <div class="col-span-full text-center py-12">
                <i class="fas fa-search text-4xl text-gray-400 mb-4"></i>
                <p class="text-gray-600">No images match your search criteria.</p>
            </div>
        `;
        return;
    }
    
    container.innerHTML = filteredImages.map(image => `
        <div class="image-card bg-white rounded-lg shadow-sm border hover:shadow-md cursor-pointer" 
             onclick="showImageDetails('${image.name}')">
            <div class="p-6">
                <div class="flex items-start justify-between mb-3">
                    <div class="flex items-center">
                        <i class="fas fa-cube text-blue-600 text-xl mr-3"></i>
                        <div>
                            <h3 class="text-lg font-semibold text-gray-900">${image.name}</h3>
                            <div class="text-xs text-gray-500">${image.version}</div>
                        </div>
                    </div>
                    <span class="category-badge category-${image.category}">${image.category.replace('-', ' ')}</span>
                </div>
                
                <p class="text-gray-600 text-sm mb-4 line-clamp-2">${image.description}</p>
                
                <div class="space-y-2 text-sm">
                    ${image.hasTest ? '<div class="flex items-center text-green-600"><i class="fas fa-check-circle mr-1"></i> Comprehensive tests</div>' : '<div class="flex items-center text-gray-500"><i class="fas fa-circle mr-1"></i> Basic tests</div>'}
                    ${image.upstream ? `<div class="flex items-center text-blue-600"><i class="fas fa-external-link-alt mr-1"></i> <a href="${image.upstream}" target="_blank" onclick="event.stopPropagation()" class="hover:underline">Upstream</a></div>` : ''}
                    <div class="flex items-center text-gray-600"><i class="fas fa-compress-arrows-alt mr-1"></i> ${formatSize(image.size)}</div>
                </div>
                
                <div class="mt-4 pt-4 border-t">
                    <div class="flex items-center justify-between">
                        <code class="text-xs bg-gray-100 px-2 py-1 rounded text-gray-700 truncate flex-1 mr-2">
                            ${image.pullCommand}
                        </code>
                        <button onclick="event.stopPropagation(); copyToClipboard('${image.pullCommand}')" 
                                class="copy-btn px-2 py-1 bg-gray-600 text-white text-xs rounded hover:bg-gray-700 transition-colors">
                            <i class="fas fa-copy"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    `).join('');
}

function showImageDetails(imageName) {
    const image = allImages.find(img => img.name === imageName);
    if (!image) return;
    
    document.getElementById('modal-title').textContent = image.name;
    
    // Convert markdown to HTML
    const readmeHtml = marked.parse(image.readme);
    
    document.getElementById('modal-content').innerHTML = `
        <div class="mb-6">
            <div class="grid grid-cols-2 md:grid-cols-5 gap-4 mb-6 text-sm">
                <div class="bg-gray-50 p-3 rounded">
                    <div class="text-gray-500">Version</div>
                    <div class="font-semibold">${image.version}</div>
                </div>
                <div class="bg-gray-50 p-3 rounded">
                    <div class="text-gray-500">Category</div>
                    <div class="font-semibold">${image.category.replace('-', ' ')}</div>
                </div>
                <div class="bg-gray-50 p-3 rounded">
                    <div class="text-gray-500">Compressed Size</div>
                    <div class="font-semibold">${formatSize(image.size)}</div>
                </div>
                <div class="bg-gray-50 p-3 rounded">
                    <div class="text-gray-500">Tests</div>
                    <div class="font-semibold">${image.hasTest ? 'Comprehensive' : 'Basic'}</div>
                </div>
                <div class="bg-gray-50 p-3 rounded">
                    <div class="text-gray-500">Aliases</div>
                    <div class="font-semibold text-xs">${image.aliases}</div>
                </div>
            </div>
            
            <div class="mb-6">
                <h4 class="font-semibold mb-2 text-gray-900">Pull Command</h4>
                <div class="flex items-center bg-gray-100 rounded p-3">
                    <code class="flex-1 text-sm font-mono">${image.pullCommand}</code>
                    <button onclick="copyToClipboard('${image.pullCommand}')" 
                            class="ml-2 px-3 py-1 bg-blue-600 text-white text-xs rounded hover:bg-blue-700 transition-colors">
                        <i class="fas fa-copy mr-1"></i> Copy
                    </button>
                </div>
            </div>
            
            ${image.upstream ? `
            <div class="mb-6">
                <h4 class="font-semibold mb-2 text-gray-900">Upstream Project</h4>
                <a href="${image.upstream}" target="_blank" class="text-blue-600 hover:text-blue-800 hover:underline">
                    <i class="fas fa-external-link-alt mr-1"></i> ${image.upstream}
                </a>
            </div>
            ` : ''}
        </div>
        
        <div class="border-t pt-6">
            <div class="prose max-w-none">
                ${readmeHtml}
            </div>
        </div>
    `;
    
    // Highlight code blocks
    document.querySelectorAll('pre code').forEach((block) => {
        hljs.highlightElement(block);
    });
    
    document.getElementById('image-modal').classList.remove('hidden');
}

function closeModal() {
    document.getElementById('image-modal').classList.add('hidden');
}

async function copyToClipboard(text) {
    try {
        await navigator.clipboard.writeText(text);
        showNotification('Copied to clipboard!');
    } catch (error) {
        // Fallback for older browsers
        const textArea = document.createElement('textarea');
        textArea.value = text;
        document.body.appendChild(textArea);
        textArea.select();
        document.execCommand('copy');
        document.body.removeChild(textArea);
        showNotification('Copied to clipboard!');
    }
}

function showNotification(message) {
    const notification = document.createElement('div');
    notification.className = 'fixed top-4 right-4 bg-green-600 text-white px-4 py-2 rounded shadow-lg z-50 transition-opacity';
    notification.innerHTML = `<i class="fas fa-check mr-2"></i>${message}`;
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.style.opacity = '0';
        setTimeout(() => notification.remove(), 300);
    }, 2000);
}

function showError(message) {
    const notification = document.createElement('div');
    notification.className = 'fixed top-4 right-4 bg-red-600 text-white px-4 py-2 rounded shadow-lg z-50';
    notification.innerHTML = `<i class="fas fa-exclamation-triangle mr-2"></i>${message}`;
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.remove();
    }, 5000);
}