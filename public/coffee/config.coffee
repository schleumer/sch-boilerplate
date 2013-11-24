"use strict"
require.config
  baseUrl: 'js'
  paths:
    main: "main"
    json3: "../components/json3/lib/json3"
    jquery: "../components/jquery/jquery"
    underscore: "../components/lodash/dist/lodash.compat"
    angular: "../components/angular/angular"
  shim:
    underscore:
      deps: []
      exports: "_"

    angular:
      deps: ["jquery", "underscore"]
      exports: "angular"

require ["main"], ->
  console.log "lel"
