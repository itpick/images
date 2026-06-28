/** @type {import('tailwindcss').Config} */
module.exports = {
  // Scan templates and any HTML produced from them. Content paths are
  // relative to where tailwindcss is invoked (the Nix buildPhase chdir's
  // into the website/ directory before running it).
  content: [
    './templates/*.html',
    './static/*.html',
    './static/*.js',
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        bg: {
          base: '#0a0a0a',
          elevated: '#171717',
          input: '#262626',
        },
        fg: {
          primary: '#e5e5e5',
          muted: '#a3a3a3',
        },
        accent: {
          ok: '#22c55e',
          warn: '#f59e0b',
          bad: '#ef4444',
        },
      },
      fontFamily: {
        sans: ['system-ui', '-apple-system', 'Segoe UI', 'Roboto', 'sans-serif'],
        mono: ['"JetBrains Mono"', 'ui-monospace', 'SFMono-Regular', 'monospace'],
      },
    },
  },
  plugins: [],
};
