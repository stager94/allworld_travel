Rails.application.config.assets.precompile += %w( home.css persons.css )
Rails.application.config.assets.precompile += %w( bootstrap.js home.js signup.js persons.js )
Rails.application.config.assets.precompile += Ckeditor.assets
Rails.application.config.assets.precompile += %w(ckeditor/*)
