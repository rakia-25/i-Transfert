// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Il faut toujours inserer ces deux dernières lignes pour que la suppression delete marche
import "@rails/ujs"
Rails.start()