# Rails.application.config.dartsass.builds = {
#   "app/index.sass"  => "app.css",
#   "site.scss"       => "site.css"
# }
Rails.application.config.dartsass.build_options << ' --load-path=node_modules'
