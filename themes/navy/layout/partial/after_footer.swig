<!-- Scripts -->
<!-- build:js build/js/main.js -->
{{ js('js/toc') }}
{{ js('js/mobile_nav') }}
{{ js('js/ui') }}
<!-- endbuild -->
<script src="https://cdn.jsdelivr.net/retinajs/1.3.0/retina.min.js" async></script>
{% if page.layout === 'plugins' %}
<!-- Plugin search -->
<script src="https://cdn.jsdelivr.net/lunr/0.6.0/lunr.min.js"></script>
<!-- build:js build/js/plugins.js -->
{{ js('js/plugins') }}
<!-- endbuild -->
{% endif %}
{{ partial('gtm') }}
<!-- Algolia -->
<script src = "https://cdn.wilddog.com/sdk/js/2.0.0/wilddog-sync.js" ></script>
