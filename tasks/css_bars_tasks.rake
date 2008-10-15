namespace "css_bars" do
  desc "Plugin installer"
  task :install => [:stylesheets, :configs]  do
    puts " * plugin css_bars installed successfull"
  end
  
  desc "Copying stylesheets"
  task :stylesheets do
    puts " * copying stylesheet \"css_bars.css to\" \"/public/stylesheets/css_bars\".."
    css_dir, css_file = File.join(RAILS_ROOT,  '/public/stylesheets/css_bars'), 
      File.join(RAILS_ROOT,  '/vendor/plugins/css_bars/stylesheets/css_bars/css_bars.css')
    FileUtils.mkdir_p(css_dir)
    FileUtils.copy(css_file, css_dir) unless File.exist?(File.join(RAILS_ROOT, "/public/stylesheets/css_bars/css_bars.css"))
  end
  
  desc "Copying config files"
  task :configs do
    puts " * copying config file \"css_bars_config.rb\" to \"/config/initializers\".."
    config_dir, config_file = File.join(RAILS_ROOT,  '/config/initializers'),
      File.join(RAILS_ROOT,  '/vendor/plugins/css_bars/initializers/css_bars_config.rb')
    FileUtils.mkdir_p(config_dir)
    FileUtils.copy(config_file, config_dir) unless File.exist?(File.join(RAILS_ROOT, "/config/initializers/css_bars_config.rb"))
  end
end