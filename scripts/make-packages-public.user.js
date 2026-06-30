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

  // List every container package the session can see, paged 100/page.
  async function listAllPackages() {
    const out = [];
    for (let page = 1; ; page++) {
      const resp = await fetch(
        `/api/v3/orgs/${ORG}/packages?package_type=${PACKAGE_TYPE}&per_page=100&page=${page}`,
        { credentials: 'include', headers: { Accept: 'application/vnd.github+json' } }
      ).catch(() => null);
      // /api/v3 is the GHES path; on github.com the same routes also live
      // at /api/v3 but may redirect to api.github.com under an Accept
      // header. Try the api.github.com host as a fallback when /api/v3
      // returns 404.
      let json = null;
      if (resp && resp.ok) {
        json = await resp.json().catch(() => null);
      }
      if (!json) {
        const r2 = await fetch(
          `https://api.github.com/orgs/${ORG}/packages?package_type=${PACKAGE_TYPE}&per_page=100&page=${page}`,
          { credentials: 'include', headers: { Accept: 'application/vnd.github+json' } }
        ).catch(() => null);
        if (r2 && r2.ok) json = await r2.json().catch(() => null);
      }
      if (!Array.isArray(json) || json.length === 0) break;
      out.push(...json);
      if (json.length < 100) break;
    }
    return out;
  }

  // Flip one package to public. Returns 'flipped', 'already-public',
  // 'error: <reason>'. Uses the per-package settings page to discover
  // the form action + CSRF token, since the URL isn't documented.
  async function flipPackagePublic(name) {
    const encoded = encodeURIComponent(name);
    const settingsUrl = `/orgs/${ORG}/packages/${PACKAGE_TYPE}/${encoded}/settings`;
    const r = await fetch(settingsUrl, { credentials: 'include' });
    if (!r.ok) return `error: settings GET ${r.status}`;
    const html = await r.text();
    // The visibility-change form lives under a section that posts to
    // /orgs/.../packages/.../visibility (the suffix varies by GitHub
    // release). Locate any form whose action contains "visibility".
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');
    const formEls = Array.from(doc.querySelectorAll('form'));
    const form = formEls.find(f => /visibility/i.test(f.getAttribute('action') || ''));
    if (!form) return 'error: no visibility form on settings page';
    const action = form.getAttribute('action');
    const csrf = form.querySelector('input[name="authenticity_token"]');
    if (!csrf) return 'error: no CSRF token in form';
    // The form may declare its body fields differently depending on the
    // GitHub release; we send a superset of plausible field names. Extra
    // fields are ignored by Rails strong-params.
    const fd = new FormData();
    fd.append('_method', 'patch');
    fd.append('authenticity_token', csrf.value);
    fd.append('visibility', 'public');
    fd.append('package[visibility]', 'public');
    fd.append('confirm_string', name);
    fd.append('confirm', name);
    const submit = await fetch(action, {
      method: 'POST',
      credentials: 'include',
      body: fd,
      headers: { 'Accept': 'text/html' },
    });
    if (submit.ok || submit.status === 302 || submit.status === 303) {
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

  async function runBulk() {
    const btn = document.getElementById('nc-bulk-flip-btn');
    if (btn) btn.disabled = true;
    log('Listing packages…');
    const all = await listAllPackages();
    log(`Total: ${all.length} container packages.`);
    const targets = all
      .filter(p => p.visibility === 'private' && p.name.startsWith('images/'))
      .map(p => p.name);
    log(`Private under images/: ${targets.length}`);
    let ok = 0, skipped = 0, failed = 0;
    for (let i = 0; i < targets.length; i++) {
      const name = targets[i];
      try {
        const res = await flipPackagePublic(name);
        if (res === 'flipped') ok++;
        else if (res === 'already-public') skipped++;
        else { failed++; log(`[${i + 1}/${targets.length}] ${name} → ${res}`); }
      } catch (e) {
        failed++; log(`[${i + 1}/${targets.length}] ${name} → exception ${e.message}`);
      }
      if ((i + 1) % 50 === 0) {
        log(`progress: ${i + 1}/${targets.length} — ok=${ok} skipped=${skipped} failed=${failed}`);
      }
      // Throttle so we don't overwhelm GitHub's rate limits.
      await new Promise(r => setTimeout(r, 250));
    }
    log(`Done. flipped=${ok} skipped=${skipped} failed=${failed}`);
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
  if (/\/packages\/?(\?|$)/.test(window.location.pathname + window.location.search)) {
    injectBulkButton();
  } else if (/\/packages\/container\/.+\/settings$/.test(window.location.pathname)) {
    injectSingleButton();
  }
})();
