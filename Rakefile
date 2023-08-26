require 'rake'
require 'fileutils'

desc 'Hook our dotfiles into system-standard positions.'
task :install => [:submodule_init, :submodules] do
  fancy_puts 'Welcome to Dotfiles Installation'
  install_homebrew_packages if RUBY_PLATFORM.downcase.include?("darwin")

  puts 'Copying run commands and applying symbolic links'
  install_files(Dir.glob('git/*'))
  install_files(Dir.glob('irb/*'))
  install_files(Dir.glob('ruby/*'))
  install_files(Dir.glob('vimify/*'))

  install_zsh_enhancements
  install_term_theme if RUBY_PLATFORM.downcase.include?('darwin')
  run_bundle_config

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

def number_of_cores
  cores = if RUBY_PLATFORM.downcase.include?('darwin')
            run %{ sysctl -n hw.ncpu }
          else
            run %{ nproc }
          end
  cores.to_i
end

def run_bundle_config
  fancy_puts 'Configuring Bundlers for parallel gem installation'
  return unless system('which bundle')

  bundler_jobs = number_of_cores - 1
  run %{ bundle config --global jobs #{bundler_jobs} }
end

def install_term_theme
  fancy_puts 'Installing iTerm2 themes'

  # Lovelace
  run %{ /usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Lovelace' dict" ~/Library/Preferences/com.googlecode.iterm2.plist }
  run %{ /usr/libexec/PlistBuddy -c "Merge 'iTerm2/Lovelace.itermcolors' :'Custom Color Presets':'Lovelace'" ~/Library/Preferences/com.googlecode.iterm2.plist }

  # Solarized Dark
  run %{ /usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Solarized Dark' dict" ~/Library/Preferences/com.googlecode.iterm2.plist }
  run %{ /usr/libexec/PlistBuddy -c "Merge 'iTerm2/Solarized Dark.itermcolors' :'Custom Color Presets':'Solarized Dark'" ~/Library/Preferences/com.googlecode.iterm2.plist }

  # If iTerm2 is not installed or has never run, we can't autoinstall the profile since the plist is not there
  if !File.exist?(File.join(ENV['HOME'], '/Library/Preferences/com.googlecode.iterm2.plist'))
    fancy_puts %q{
      "To make sure your profile is using the theme"
      "Please check your settings under:"
      "Preferences> Profiles> [your profile]> Colors> Load Preset.."
    }

    return
  end

  # Install and apply lovelace iTerm theme to the profiles
  profiles = ['Default']
  color_scheme_file = File.join('iTerm2', 'lovelace.itermcolors')
  apply_theme_to_iterm_profile_idx(profiles.index('Default'), color_scheme_file)
end

def apply_theme_to_iterm_profile_idx(index, color_scheme_path)
  values = Array.new
  16.times { |i| values << "Ansi #{i} Color" }
  values << ['Background Color', 'Bold Color', 'Cursor Color', 'Cursor Text Color', 'Foreground Color', 'Selected Text Color', 'Selection Color']
  values.flatten.each { |entry| run %{ /usr/libexec/PlistBuddy -c "Delete :'New Bookmarks':#{index}:'#{entry}'" ~/Library/Preferences/com.googlecode.iterm2.plist } }

  run %{ /usr/libexec/PlistBuddy -c "Merge '#{color_scheme_path}' :'New Bookmarks':#{index}" ~/Library/Preferences/com.googlecode.iterm2.plist }
  run %{ defaults read com.googlecode.iterm2 }
end

def install_homebrew_packages
  run %{which brew}
  if $?.success?
    puts 'Installing Homebrew packages... There may be some warnings...'
    run %{brew install zsh starship nvim bat git-delta duf tldr}
    run %{brew tap cantino/mcfly}
    run %{brew install cantino/mcfly/mcfly}

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
  # Install fzf is a general-purpose command-line fuzzy finder.
  install_files(Dir.glob('zsh/fzf'), :symlink)
  run %{ $HOME/.fzf/install --all --no-update-rc --no-bash --no-fish }

  puts 'Creating directories for your customizations'
  run %{ mkdir -p $HOME/.zsh.before }
  run %{ mkdir -p $HOME/.zsh.after }
  run %{ mkdir -p $HOME/.zsh.prompts }

  if "#{ENV['SHELL']}".include? 'zsh' then
    puts 'Zsh is already configured as your shell of choice. Restart your session to load the new settings'
  else
    puts 'Setting zsh as your default shell'
    if File.exists?("/usr/local/bin/zsh")
      if File.readlines("/private/etc/shells").grep("/usr/local/bin/zsh").empty?
        puts "Adding zsh to standard shell list"
        run %{ echo "/usr/local/bin/zsh" | sudo tee -a /private/etc/shells }
      end
      run %{ chsh -s /usr/local/bin/zsh }
    else
      run %{ chsh -s /bin/zsh }
    end
  end
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


