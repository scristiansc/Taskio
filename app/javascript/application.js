// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "popper"
import "cocoon"
import "bootstrap"

// Hacer jQuery global
window.$ = window.jQuery = globalThis.jQuery
import * as bootstrap from "bootstrap"
