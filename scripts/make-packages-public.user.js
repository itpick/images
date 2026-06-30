// ==UserScript==
// @name         nix-containers: bulk make packages public
// @namespace    nix-containers
// @version      0.1.0
// @description  Flip private container packages under nix-containers org to public, in the user's authenticated browser session. Workaround for GitHub's missing REST endpoint for visibility changes.
// @match        https://github.com/orgs/nix-containers/packages*
// @match        https://github.com/orgs/nix-containers/packages/container/images*
// @grant        none
// @run-at       document-idle
// ==/UserScript==

// Activation:
//   1. Install Tampermonkey (Chrome, Firefox, etc.).
//   2. Open this file's raw URL and Tampermonkey will prompt to install.
//   3. Visit https://github.com/orgs/nix-containers/packages?repo_name=images
//      and click the "Make ALL private public" button injected at the top
//      of the page.
//
// What it does:
//   - Listing page: fetches every private container package via the GitHub
//     packages API (paginated), then per-package:
//       * Fetches the package settings page HTML
//       * Locates the visibility-change form + CSRF token
//       * POSTs to the form's action with visibility=public + the type-to-
//         confirm string (the package's full name path)
//   - Per-package settings page: adds a "Make Public Now" button next to
//     the existing visibility section that fires the same POST directly.
//
// Cookie auth: all fetches use credentials:'include' so the user's session
// cookie carries the request. No PAT needed; no scope concerns.
//
// Progress + errors render in a fixed-position overlay at the top-right
// of the listing page. Re-runnable: already-public packages return 200
// with no change and get counted as 'already-public'.

(function () {
  'use strict';

  const ORG = 'nix-containers';
  const PACKAGE_TYPE = 'container';

  // Status sink the bulk-runner writes to. The element is created lazily
  // when the runner starts so we don't clutter pages where the user
  // isn't running anything.
  function statusUI() {
    let el = document.getElementById('nc-visibility-status');
    if (el) return el;
    el = document.createElement('div');
    el.id = 'nc-visibility-status';
    el.style.cssText = `
      position: fixed; top: 12px; right: 12px; z-index: 99999;
      background: #0d1117; color: #e6edf3; border: 1px solid #30363d;
      border-radius: 8px; padding: 12px 16px; font: 13px/1.5 system-ui;
      max-width: 360px; max-height: 60vh; overflow: auto;
      box-shadow: 0 8px 24px rgba(0,0,0,0.5);
    `;
    document.body.appendChild(el);
    return el;
  }
  function log(msg) {
    const el = statusUI();
    const line = document.createElement('div');
    line.textContent = msg;
    line.style.marginTop = '4px';
    el.appendChild(line);
    el.scrollTop = el.scrollHeight;
  }

  // Scrape the LIVE DOM of the current page. React has already
  // hydrated the package cards by the time Tampermonkey fires at
  // document-idle, so the anchors are present.
  function scrapeCurrentPage() {
    const items = [];
    const seenThisPage = new Set();
    const anchors = Array.from(
      document.querySelectorAll(`a[href*="/orgs/${ORG}/packages/container/"]`)
    );
    for (const a of anchors) {
      const m = a.getAttribute('href').match(
        new RegExp(`/orgs/${ORG}/packages/container/(?:package/)?([^/?#]+)`)
      );
      if (!m) continue;
      const encoded = m[1];
      let name;
      try { name = decodeURIComponent(encoded); } catch { name = encoded; }
      if (seenThisPage.has(name)) continue;
      seenThisPage.add(name);
      const card = a.closest('li, article, div');
      const txt = (card ? card.textContent : '').toLowerCase();
      const isPrivate = /\bprivate\b/.test(txt);
      const isInternal = !isPrivate && /\binternal\b/.test(txt);
      const visibility = isPrivate ? 'private' : (isInternal ? 'internal' : 'public');
      items.push({ name, visibility });
    }
    return items;
  }

  // localStorage keys for the cross-page-navigation state machine.
  const LS_KEY = 'nc-bulk-flip-state';
  function loadState() {
    try { return JSON.parse(localStorage.getItem(LS_KEY) || 'null'); }
    catch { return null; }
  }
  function saveState(s) { localStorage.setItem(LS_KEY, JSON.stringify(s)); }
  function clearState() { localStorage.removeItem(LS_KEY); }

  // Flip one package to public. Returns 'flipped', 'already-public',
  // 'error: <reason>'. Confirmed via inspection of the settings page
  // HTML (the visibility-change form is the one whose action ends in
  // /settings/change_visibility).
  async function flipPackagePublic(name) {
    const encoded = encodeURIComponent(name);
    const settingsUrl = `/orgs/${ORG}/packages/${PACKAGE_TYPE}/${encoded}/settings`;
    const r = await fetch(settingsUrl, { credentials: 'include' });
    if (!r.ok) return `error: settings GET ${r.status}`;
    const html = await r.text();
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');
    const action = `/orgs/${ORG}/packages/${PACKAGE_TYPE}/${encoded}/settings/change_visibility`;
    // Find the form whose action exactly matches the change_visibility
    // route so we pick up its CSRF token.
    const form = Array.from(doc.querySelectorAll('form'))
      .find(f => (f.getAttribute('action') || '').endsWith('/settings/change_visibility'));
    if (!form) {
      return 'error: settings page lacks change_visibility form (already-public?)';
    }
    const csrf = form.querySelector('input[name="authenticity_token"]');
    if (!csrf) return 'error: no CSRF token in form';
    // Three fields the modal submits, confirmed via the rendered HTML:
    //   visibility=public
    //   verify=<full package name like "images/zoxide">
    //   authenticity_token=<csrf>
    const fd = new FormData();
    fd.append('authenticity_token', csrf.value);
    fd.append('visibility', 'public');
    fd.append('verify', name);
    const submit = await fetch(action, {
      method: 'POST',
      credentials: 'include',
      body: fd,
      // GitHub returns 302 on success — capture rather than auto-follow
      // so we can detect the outcome cleanly.
      redirect: 'manual',
      headers: { 'Accept': 'text/html' },
    });
    if (submit.ok || submit.status === 0 || submit.status === 302 || submit.status === 303) {
      return 'flipped';
    }
    return `error: submit ${submit.status}`;
  }

  // ----- Bulk runner injected on the org-packages listing page -----
  function injectBulkButton() {
    if (document.getElementById('nc-bulk-flip-btn')) return;
    const host = document.querySelector('main') || document.body;
    const btn = document.createElement('button');
    btn.id = 'nc-bulk-flip-btn';
    btn.textContent = 'Make ALL private packages public';
    btn.style.cssText = `
      margin: 12px; padding: 8px 16px; background: #238636; color: #fff;
      border: 0; border-radius: 6px; font-weight: 600; cursor: pointer;
    `;
    btn.addEventListener('click', runBulk);
    host.prepend(btn);
  }

  // Phase 1 of bulk: listing. Auto-navigates page by page, scraping the
  // live DOM at each step. State persists in localStorage so a navigation
  // doesn't lose our progress. When we hit an empty page (no anchors),
  // transitions to phase 'flipping' and reloads to start phase 2.
  async function continueListing(state) {
    log(`Listing… page ${state.currentPage}, collected ${state.collected.length} so far`);
    const items = scrapeCurrentPage();
    let added = 0;
    const seen = new Set(state.collected.map(p => p.name));
    for (const it of items) {
      if (seen.has(it.name)) continue;
      seen.add(it.name);
      state.collected.push(it);
      added++;
    }
    log(`page ${state.currentPage}: +${added} (running total ${state.collected.length})`);
    if (added === 0 || items.length === 0) {
      // End of listing — switch to flipping.
      const targets = state.collected
        .filter(p => p.visibility === 'private' && p.name.startsWith('images/'))
        .map(p => p.name);
      state.phase = 'flipping';
      state.targets = targets;
      state.flipIndex = 0;
      state.ok = 0;
      state.skipped = 0;
      state.failed = 0;
      saveState(state);
      log(`Total: ${state.collected.length} packages. Private under images/: ${targets.length}.`);
      log('Starting flip phase…');
      // Phase 2 doesn't navigate; continues on this page.
      await continueFlipping(state);
      return;
    }
    state.currentPage++;
    saveState(state);
    // Throttle to be polite, then navigate.
    await new Promise(r => setTimeout(r, 500));
    window.location.href = `/orgs/${ORG}/packages?page=${state.currentPage}`;
  }

  // Phase 2: flipping. Iterates state.targets, then loops back over
  // state.failures (populated on first pass) to retry any that hit a
  // transient error. Each failure is logged by name so we know what's
  // still stuck after the retry pass.
  async function continueFlipping(state) {
    if (!Array.isArray(state.failures)) state.failures = [];
    // First pass
    while (state.flipIndex < state.targets.length) {
      const i = state.flipIndex;
      const name = state.targets[i];
      try {
        const res = await flipPackagePublic(name);
        if (res === 'flipped') state.ok++;
        else if (res === 'already-public') state.skipped++;
        else { state.failed++; state.failures.push(name); log(`[${i + 1}/${state.targets.length}] ${name} → ${res}`); }
      } catch (e) {
        state.failed++;
        state.failures.push(name);
        log(`[${i + 1}/${state.targets.length}] ${name} → exception ${e.message}`);
      }
      state.flipIndex++;
      if (state.flipIndex % 50 === 0) {
        log(`progress: ${state.flipIndex}/${state.targets.length} — ok=${state.ok} skipped=${state.skipped} failed=${state.failed}`);
        saveState(state);
      }
      await new Promise(r => setTimeout(r, 250));
    }
    // Retry pass — only if there are failures and we haven't already
    // retried on this run.
    if (state.failures.length > 0 && !state.retriedOnce) {
      log(`Retrying ${state.failures.length} failed packages with longer backoff…`);
      const toRetry = state.failures.slice();
      state.failures = [];
      const before = state.ok;
      for (let i = 0; i < toRetry.length; i++) {
        const name = toRetry[i];
        try {
          const res = await flipPackagePublic(name);
          if (res === 'flipped') { state.ok++; state.failed = Math.max(0, state.failed - 1); }
          else if (res === 'already-public') { state.skipped++; state.failed = Math.max(0, state.failed - 1); }
          else { state.failures.push(name); log(`retry [${i + 1}/${toRetry.length}] ${name} → ${res}`); }
        } catch (e) {
          state.failures.push(name);
          log(`retry [${i + 1}/${toRetry.length}] ${name} → exception ${e.message}`);
        }
        if ((i + 1) % 25 === 0) {
          log(`retry progress: ${i + 1}/${toRetry.length} — recovered ${state.ok - before}`);
          saveState(state);
        }
        // Slower throttle for the retry pass.
        await new Promise(r => setTimeout(r, 750));
      }
      state.retriedOnce = true;
      log(`Retry recovered ${state.ok - before} of ${toRetry.length}.`);
    }
    log(`Done. flipped=${state.ok} skipped=${state.skipped} failed=${state.failed}`);
    if (state.failures.length > 0) {
      log(`Still failing (${state.failures.length}): first 10 = ${state.failures.slice(0, 10).join(', ')}`);
    }
    // Don't wipe state — keep state.targets around so a follow-up
    // 'linking' phase can reuse the same list without re-listing.
    // Mark the phase done so the auto-resume on next page load
    // doesn't restart anything.
    state.phase = 'flipped';
    state.flippedAt = new Date().toISOString();
    saveState(state);
    log('State preserved in localStorage as nc-bulk-flip-state for the linking pass.');
  }

  async function runBulk() {
    const btn = document.getElementById('nc-bulk-flip-btn');
    if (btn) btn.disabled = true;
    let state = loadState();
    if (state) {
      log('Found in-progress state; resuming.');
    } else {
      state = { phase: 'listing', collected: [], currentPage: 1 };
      saveState(state);
    }
    if (state.phase === 'listing') {
      await continueListing(state);
    } else if (state.phase === 'flipping') {
      await continueFlipping(state);
    } else if (state.phase === 'flipped') {
      log(`Flip already complete (${state.flippedAt || '?'}). state.targets has ${state.targets?.length || 0} names — feed them to the link pass when it's ready.`);
    }
    if (btn) btn.disabled = false;
  }

  // ----- One-shot button injected on a package's settings page -----
  function injectSingleButton() {
    if (document.getElementById('nc-single-flip-btn')) return;
    const m = window.location.pathname.match(
      new RegExp(`/orgs/${ORG}/packages/${PACKAGE_TYPE}/(.+)/settings$`)
    );
    if (!m) return;
    const name = decodeURIComponent(m[1]);
    const host = document.querySelector('main') || document.body;
    const btn = document.createElement('button');
    btn.id = 'nc-single-flip-btn';
    btn.textContent = 'Make Public Now';
    btn.style.cssText = `
      margin: 12px; padding: 8px 16px; background: #238636; color: #fff;
      border: 0; border-radius: 6px; font-weight: 600; cursor: pointer;
    `;
    btn.addEventListener('click', async () => {
      btn.disabled = true;
      btn.textContent = 'Flipping…';
      const res = await flipPackagePublic(name);
      btn.textContent = `Result: ${res}`;
    });
    host.prepend(btn);
  }

  // Pick the right injector based on the current path.
  const pathAndQuery = window.location.pathname + window.location.search;
  if (/\/packages\/?(\?|$)/.test(pathAndQuery)) {
    injectBulkButton();
    // Auto-resume if an in-progress state exists (we got here via the
    // listing phase auto-navigation, not a fresh click).
    const state = loadState();
    if (state) {
      // Give React a moment to populate the page before scraping.
      setTimeout(() => runBulk(), 1500);
    }
  } else if (/\/packages\/container\/.+\/settings$/.test(window.location.pathname)) {
    injectSingleButton();
  }
})();
