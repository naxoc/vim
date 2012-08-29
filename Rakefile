require 'rake'

home_dir = ENV['HOME']
current_dir = File.dirname(__FILE__)

desc 'Install plugins and vim config files'

bundles = {
  'https://github.com/tpope/vim-pathogen.git' => 'pathogen',
  'git://github.com/scrooloose/nerdcommenter.git' => 'nerdcommenter',
  'https://github.com/scrooloose/nerdtree.git' => 'nerdtree',
  'git://github.com/cakebaker/scss-syntax.vim.git' => 'scss-syntax.vim.git',
  'http://github.com/sjl/gundo.vim.git' => 'gundo',
  'https://github.com/Lokaltog/vim-easymotion.git' => 'easymotion'
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
    system "mkdir -p #{current_dir}/_backup #{current_dir}/_temp #{current_dir}/sessions"
  end
end

namespace :bundles do
  task :install => [:clone] do
    puts "Installed bundles"
  end
  task :update => [:fetch] do
    puts "Updated bundles"
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
end
