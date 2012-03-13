require 'rake'

home_dir = ENV['HOME']
current_dir = File.dirname(__FILE__)

desc 'Install plugins and vim config files'

bundles = {
  'https://github.com/tpope/vim-pathogen.git' => 'pathogen',
  'git://github.com/scrooloose/nerdcommenter.git' => 'nerdcommenter',
  'https://github.com/Lokaltog/vim-powerline.git' => 'powerline',
  'git://git.wincent.com/command-t.git' => 'command-t',
  'https://github.com/groenewege/vim-less.git' => 'vim-less'
}

task :default do
  puts 'vim:setup - to symlink the .vimrc and .gvimrc files to your homedir'
  puts 'bundles:install - to install a plugins to plugins folder'
  puts 'bundles:update - update all installed plugins'
end

namespace :vim do
  desc 'Symlinking config files to home dir'
  task :setup do
    puts '== Symlinking vimrc and gvimrc to your homedir'
    system "ln -Fins #{current_dir}/vimrc #{home_dir}/.vimrc"
    system "ln -Fins #{current_dir}/gvimrc #{home_dir}/.gvimrc"
    system "ln -Fins #{current_dir}/ctags #{home_dir}/.ctags"
    system "mkdir -p #{current_dir}/_backup #{current_dir}/_temp"
  end
end

namespace :bundles do
  task :install => [:clone, :custom_compile] do
    puts "Installed and compiled bundles"
  end
  task :update => [:fetch, :custom_compile] do
    puts "Updated and compiled bundles"
  end
  task :clone do
    bundles.each do |bundle, folder|
      puts "Cloning from #{bundle}"
      system "git clone --quiet #{bundle} bundle/#{folder}"
      puts
    end
  end
  task :fetch do
    Dir.glob("#{current_dir}/bundle/*").each do |path|
      Dir.chdir(path) {
        puts "Updating #{path}"
        system "git fetch --quiet"
        system "git rebase"
        puts
      }
    end
  end
  task :custom_compile do
    # command-t needs to be compiled with some c stuff upon install and
    # update.
    system "cd #{current_dir}/bundle/command-t; bundle install; rake make"
  end
end
