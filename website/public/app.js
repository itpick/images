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
    document.getElementById('refresh-btn').addEventListener('click', loadImages);
    
    // Modal functionality
    document.getElementById('close-modal').addEventListener('click', closeModal);
    document.getElementById('image-modal').addEventListener('click', function(e) {
        if (e.target === this) closeModal();
    });
}

async function loadImages() {
    try {
        const response = await fetch('/api/images');
        allImages = await response.json();
        filteredImages = [...allImages];
        
        document.getElementById('image-count').textContent = `${allImages.length} images`;
        renderImages();
    } catch (error) {
        console.error('Error loading images:', error);
        showError('Failed to load images. Please try again.');
    }
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
    
    renderImages();
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
                        <h3 class="text-lg font-semibold text-gray-900">${image.name}</h3>
                    </div>
                    <span class="category-badge category-${image.category}">${image.category}</span>
                </div>
                
                <p class="text-gray-600 text-sm mb-4 line-clamp-2">${image.description || 'No description available'}</p>
                
                <div class="space-y-2 text-sm">
                    <div class="flex justify-between">
                        <span class="text-gray-500">Version:</span>
                        <span class="font-medium">${image.version}</span>
                    </div>
                    <div class="flex justify-between">
                        <span class="text-gray-500">Size:</span>
                        <span class="font-medium">${image.size}</span>
                    </div>
                    <div class="flex justify-between">
                        <span class="text-gray-500">Tags:</span>
                        <span class="font-medium">${image.tags.join(', ')}</span>
                    </div>
                    ${image.hasTest ? '<div class="flex items-center text-green-600"><i class="fas fa-check-circle mr-1"></i> Tests available</div>' : ''}
                </div>
                
                <div class="mt-4 pt-4 border-t">
                    <div class="flex items-center justify-between">
                        <code class="text-xs bg-gray-100 px-2 py-1 rounded text-gray-700 truncate flex-1 mr-2">
                            ${image.pullCommand}
                        </code>
                        <button onclick="event.stopPropagation(); copyToClipboard('${image.pullCommand}')" 
                                class="copy-btn px-2 py-1 bg-gray-600 text-white text-xs rounded hover:bg-gray-700">
                            <i class="fas fa-copy"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    `).join('');
}

async function showImageDetails(imageName) {
    try {
        const response = await fetch(`/api/images/${imageName}`);
        const image = await response.json();
        
        document.getElementById('modal-title').textContent = image.name;
        document.getElementById('modal-content').innerHTML = `
            <div class="mb-6">
                <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-6 text-sm">
                    <div class="bg-gray-50 p-3 rounded">
                        <div class="text-gray-500">Version</div>
                        <div class="font-semibold">${image.version}</div>
                    </div>
                    <div class="bg-gray-50 p-3 rounded">
                        <div class="text-gray-500">Size</div>
                        <div class="font-semibold">${image.size}</div>
                    </div>
                    <div class="bg-gray-50 p-3 rounded">
                        <div class="text-gray-500">Category</div>
                        <div class="font-semibold">${image.category}</div>
                    </div>
                    <div class="bg-gray-50 p-3 rounded">
                        <div class="text-gray-500">Tests</div>
                        <div class="font-semibold">${image.hasTest ? 'Available' : 'Basic only'}</div>
                    </div>
                </div>
                
                <div class="mb-6">
                    <h4 class="font-semibold mb-2">Pull Command</h4>
                    <div class="flex items-center bg-gray-100 rounded p-3">
                        <code class="flex-1 text-sm">${image.pullCommand}</code>
                        <button onclick="copyToClipboard('${image.pullCommand}')" 
                                class="ml-2 px-3 py-1 bg-blue-600 text-white text-xs rounded hover:bg-blue-700">
                            <i class="fas fa-copy mr-1"></i> Copy
                        </button>
                    </div>
                </div>
                
                ${image.tags.length > 1 ? `
                <div class="mb-6">
                    <h4 class="font-semibold mb-2">Available Tags</h4>
                    <div class="flex flex-wrap gap-2">
                        ${image.tags.map(tag => `
                            <span class="bg-blue-100 text-blue-800 px-2 py-1 rounded text-sm">${tag}</span>
                        `).join('')}
                    </div>
                </div>
                ` : ''}
                
                ${image.upstream ? `
                <div class="mb-6">
                    <h4 class="font-semibold mb-2">Upstream</h4>
                    <a href="${image.upstream}" target="_blank" class="text-blue-600 hover:text-blue-800">
                        <i class="fas fa-external-link-alt mr-1"></i> ${image.upstream}
                    </a>
                </div>
                ` : ''}
            </div>
            
            <div class="border-t pt-6">
                ${image.readme}
            </div>
        `;
        
        document.getElementById('image-modal').classList.remove('hidden');
    } catch (error) {
        console.error('Error loading image details:', error);
        showError('Failed to load image details.');
    }
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
    notification.className = 'fixed top-4 right-4 bg-green-600 text-white px-4 py-2 rounded shadow-lg z-50';
    notification.textContent = message;
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.remove();
    }, 3000);
}

function showError(message) {
    const notification = document.createElement('div');
    notification.className = 'fixed top-4 right-4 bg-red-600 text-white px-4 py-2 rounded shadow-lg z-50';
    notification.textContent = message;
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.remove();
    }, 5000);
}