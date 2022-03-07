var CACHE = 'cache-v1';

var urls = [
  '/',
  'favicon.svg',
  'manifest.webmanifest',
  'dino.wasm', // WASM binary
  'icon-192x192.png', // Default favicon size fetched by Chrome on desktop
  'icon-512x512.png', // Apple touch icon
  'sw.js'
];

self.addEventListener('install', function(event) {
  // Perform install steps
  event.waitUntil(
    caches.open(CACHE)
      .then(function(cache) {
        return cache.addAll(urls);
      })
  );
});

self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.match(event.request)
      .then(function(response) {
        // Cache hit - return response
        if (response) {
          return response;
        }
        return fetch(event.request);
      }
    )
  );
});