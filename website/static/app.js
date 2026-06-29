let allImages = [];
let filteredImages = [];
const BASE = window.SITE_BASE || '/';

document.addEventListener('DOMContentLoaded', () => {
  loadImages();
  document.getElementById('search').addEventListener('input', filter);
  document.getElementById('category-filter').addEventListener('change', filter);
  document.getElementById('chart-filter').addEventListener('change', filter);
});

async function loadImages() {
  try {
    const r = await fetch(BASE + 'images-data.json');
    const data = await r.json();
    allImages = data.images || [];
    filteredImages = [...allImages];
    updateStats(data);
    populateCategoryFilter();
    render();
  } catch (e) {
    showError('Failed to load images-data.json: ' + e.message);
  }
}

function updateStats(data) {
  document.getElementById('total-images').textContent = data.totalCount ?? allImages.length;
  document.getElementById('tested-images').textContent =
    allImages.filter(i => i.hasTest).length;
  document.getElementById('categories-count').textContent =
    new Set(allImages.map(i => i.category)).size;
  const totalCritical = allImages.reduce(
    (acc, i) => acc + ((i.scan && i.scan.critical) || 0), 0);
  document.getElementById('critical-count').textContent = totalCritical;
}

function populateCategoryFilter() {
  const cats = [...new Set(allImages.map(i => i.category))].sort();
  const sel = document.getElementById('category-filter');
  cats.forEach(c => {
    const opt = document.createElement('option');
    opt.value = c;
    opt.textContent = c;
    sel.appendChild(opt);
  });
}

function filter() {
  const q = document.getElementById('search').value.toLowerCase();
  const cat = document.getElementById('category-filter').value;
  const chartsOnly = document.getElementById('chart-filter').checked;
  filteredImages = allImages.filter(i => {
    const matchesQ = !q ||
      i.name.toLowerCase().includes(q) ||
      (i.description || '').toLowerCase().includes(q);
    const matchesCat = !cat || i.category === cat;
    const matchesChart = !chartsOnly ||
      (Array.isArray(i.usedByCharts) && i.usedByCharts.length > 0);
    return matchesQ && matchesCat && matchesChart;
  });
  render();
}

function render() {
  const c = document.getElementById('images-container');
  const counter = document.getElementById('results-count');
  if (counter) {
    const shown = filteredImages.length;
    const total = allImages.length;
    counter.textContent = shown === total
      ? `Showing all ${total.toLocaleString()} images`
      : `Showing ${shown.toLocaleString()} of ${total.toLocaleString()} images`;
  }
  if (filteredImages.length === 0) {
    c.innerHTML = `<div class="col-span-full text-center py-12 text-fg-muted">
      No images match your filters.
    </div>`;
    return;
  }
  c.innerHTML = filteredImages.map(i => {
    // Green dot when scan + sbom + dep-check are all recent (≤7d).
    const dot = (i.freshness && i.freshness.isFresh)
      ? `<span class="inline-block w-2 h-2 rounded-full bg-accent-ok mr-2 align-middle"
               title="Fresh data: scanned, SBOM available, deps checked within 7 days"></span>`
      : '';
    // Rank from IMAGE-POPULARITY.md, when present.
    const rank = (i.popularity && i.popularity.rank)
      ? `<span class="text-xs text-fg-muted font-mono">#${i.popularity.rank}</span>`
      : '';
    // The registry tag is always 'latest'; the image's OCI label gives
    // the semver (e.g. "3.4.3"). Show both; collapse to just 'latest' if
    // no version label or it's still a dynamic-* placeholder.
    const v = (i.version || '').trim();
    const showLatestPlusVersion = v && v !== 'latest' && !v.startsWith('dynamic-');
    const versionLine = showLatestPlusVersion
      ? `latest, ${escapeHtml(v)}`
      : 'latest';
    return `
    <a href="${BASE}images/${escapeAttr(i.name)}/"
       class="card block">
      <div class="flex items-center justify-between mb-2">
        <div class="font-mono font-bold text-fg-primary">${dot}${escapeHtml(i.name)}</div>
        <div class="flex items-center gap-2">
          ${rank}
          <span class="badge-cat-${escapeAttr(i.categorySlug || 'unknown')}">${escapeHtml(i.category || 'unknown')}</span>
        </div>
      </div>
      <p class="text-sm text-fg-muted line-clamp-2">${escapeHtml(i.description || '')}</p>
      <div class="mt-3 text-xs text-fg-muted font-mono">${versionLine}</div>
    </a>
  `;}).join('');
}

function escapeHtml(s) {
  const div = document.createElement('div');
  div.textContent = s;
  return div.innerHTML;
}

function escapeAttr(s) {
  return String(s).replace(/[^\w-]/g, '');
}

function showError(msg) {
  document.getElementById('images-container').innerHTML =
    `<div class="col-span-full text-center py-12 text-accent-bad">${escapeHtml(msg)}</div>`;
}
