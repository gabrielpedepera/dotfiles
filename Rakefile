require 'rake'
require 'fileutils'

desc 'Hook our dotfiles into system-standard positions.'
task :install => [:submodule_init, :submodules] do
  fancy_puts 'Welcome to Dotfiles Installation'

  if RUBY_PLATFORM.downcase.include?("darwin")
    install_homebrew_packages
  end

  puts 'Copying run commands and applying symbolic links'
  install_files(Dir.glob('git/*'))

  install_zsh_enhancements
  configure_nvim

  success_msg("installed")
end

desc 'Updates the installation'
task :update do
  Rake::Task['install'].execute
end

task :submodule_init do
  run %{ git submodule update --init --recursive }
end

desc 'Init and update submodules'
task :submodules do
  fancy_puts 'Downloading submodules'

  run %{
    cd $HOME/.dotfiles
    git submodule update --recursive
    git clean -df
  }
end

task :default => 'install'

private

def run(cmd)
  `#{cmd}` unless ENV['DEBUG']
end

def install_homebrew_packages
  run %{which brew}
  if $?.success?
    puts 'Installing Homebrew packages... There may be some warnings...'
    run %{brew install asdf nvim bat git-delta duf tldr jandedobbeleer/oh-my-posh/oh-my-posh font-hack-nerd-font}
  else
    abort %q{
      You need to install homebrew manually first:
      $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    }
  end
  puts
end

def install_zsh_enhancements
  fancy_puts 'ZSH Enhancements'

  install_files(Dir.glob('zsh/zshrc/zshrc'), :symlink)

  if "#{ENV['SHELL']}".include? 'zsh' then
    puts 'Zsh is already configured as your shell of choice. Restart your session to load the new settings'
  else
    puts 'You need to set Zsh as your default shell'
  end
end

def configure_nvim
  fancy_puts 'Set Nvim configuration'
  run %{ mkdir -p "#{ENV["HOME"]}/.config" }
  run %{ ln -nfs "#{ENV["PWD"]}/nvim" "#{ENV["HOME"]}/.config/nvim" }
end

def install_files(files, method = :symlink)
  files.each do |f|
    file = f.split('/').last
    source = "#{ENV["PWD"]}/#{f}"
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exist?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    if method == :symlink
      run %{ ln -nfs "#{source}" "#{target}" }
    else
      run %{ cp -f "#{source}" "#{target}" }
    end
  end
end

def fancy_puts(message)
  puts
  puts "🚀 #{message}"
  puts '======================================================'
end

def success_msg(action)
  puts
  puts "Dotfiles has been #{action}. Please restart your terminal. ✌️"
end
