# Jekyll Local Development Setup for macOS

This guide provides step-by-step instructions for setting up Jekyll locally on macOS, specifically tested on macOS 15 (Sequoia). This setup uses `chruby` and `ruby-install` as recommended by the official Jekyll documentation.

## Why This Setup?

- **Works on macOS 15+**: Homebrew's Ruby 4.0 and Ruby 3.3 have compatibility issues with native gem extensions on macOS 15
- **Recommended by Jekyll**: Official Jekyll docs recommend chruby + ruby-install
- **Version management**: Easily switch between Ruby versions for different projects
- **Matches production**: Using Ruby 3.4.1 compiles gems that work across environments

## Prerequisites

- macOS (tested on macOS 15 Sequoia, but works on earlier versions)
- Homebrew package manager installed
- Xcode Command Line Tools (usually already installed)

## Installation Steps

### 1. Install chruby and ruby-install

```bash
brew install chruby ruby-install
```

### 2. Install Ruby 3.4.1

This step takes several minutes as it compiles Ruby from source:

```bash
ruby-install ruby 3.4.1
```

**Note:** Compilation from source avoids the native extension issues present in Homebrew's pre-built Ruby packages on macOS 15.

### 3. Configure Your Shell

Add chruby to your shell configuration file. For **zsh** (macOS default):

```bash
cat >> ~/.zshrc << 'EOF'

# chruby configuration for Jekyll development
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
chruby ruby-3.4.1
EOF
```

For **bash** users, replace `~/.zshrc` with `~/.bash_profile` or `~/.bashrc`.

### 4. Activate the Configuration

**Important:** You need to start a new terminal session or source your configuration:

```bash
source ~/.zshrc
```

### 5. Verify Ruby Installation

```bash
ruby -v
# Should output: ruby 3.4.1 (2024-12-25 revision 48d4efcb85) +PRISM [arm64-darwin20]

which ruby
# Should output: /Users/YOUR_USERNAME/.rubies/ruby-3.4.1/bin/ruby
```

## Setting Up a Jekyll Site

### For GitHub Pages Sites

If your site uses GitHub Pages, use the `github-pages` gem for compatibility:

**Gemfile:**
```ruby
source "https://rubygems.org"

# Use github-pages gem to match GitHub Pages environment
gem "github-pages", group: :jekyll_plugins

# Additional plugins not in github-pages
group :jekyll_plugins do
  gem "jekyll-include-cache"
end

# Performance booster for macOS/Windows
gem "webrick", "~> 1.8"
```

### For Regular Jekyll Sites

If not using GitHub Pages, you can use Jekyll 4.x:

**Gemfile:**
```ruby
source "https://rubygems.org"

gem "jekyll", "~> 4.3"

group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
end

gem "webrick", "~> 1.8"
```

### Install Dependencies

```bash
cd your-jekyll-site
gem install bundler
bundle install
```

## Running Jekyll Locally

### Standard Jekyll Serve

```bash
bundle exec jekyll serve
```

Then open http://localhost:4000 in your browser.

### With Live Reload

```bash
bundle exec jekyll serve --livereload
```

### On a Different Port

```bash
bundle exec jekyll serve --port 4001
```

Then open http://localhost:4001 in your browser.

### Multiple Sites Simultaneously

You can run multiple Jekyll sites at the same time on different ports:

Terminal 1:
```bash
cd ~/site1
bundle exec jekyll serve --port 4000
```

Terminal 2:
```bash
cd ~/site2
bundle exec jekyll serve --port 4001
```

## Important Note About Bash Tool Usage in This Repository

When using command-line tools in subdirectories of this repository, you may need to prefix commands with the shell configuration. This is because non-interactive shells don't automatically load your `.zshrc`:

**Instead of:**
```bash
cd my-site
bundle install
```

**Use:**
```bash
cd my-site
zsh -c 'source ~/.zshrc && bundle install'
```

Or simply open a new terminal window and navigate to the directory normally.

## Troubleshooting

### "The compiler failed to generate an executable file"

This error occurs when trying to use Homebrew's Ruby 3.3 or 4.0 on macOS 15. Solution: Use Ruby 3.4.1 installed via `ruby-install` as described above.

### "command not found: bundle"

Install bundler:
```bash
gem install bundler
```

### Ruby Version Not Changing

1. Open a new terminal window
2. Verify configuration was added: `cat ~/.zshrc | grep chruby`
3. Source manually: `source ~/.zshrc`
4. Check: `ruby -v`

### Gems Installing to Wrong Ruby Version

Check which Ruby is active:
```bash
which ruby
gem env home
```

Should show paths in `~/.rubies/ruby-3.4.1/`

### Port Already in Use

If you see "Address already in use" error:

```bash
# Find what's using port 4000
lsof -i :4000

# Kill the process
kill -9 PID_NUMBER

# Or use a different port
bundle exec jekyll serve --port 4001
```

## Project-Specific Ruby Versions

If you need different Ruby versions for different projects, chruby supports `.ruby-version` files:

```bash
cd my-project
echo "ruby-3.4.1" > .ruby-version
```

When you `cd` into this directory, chruby will automatically switch to Ruby 3.4.1 (requires the `chruby/auto.sh` line in your shell config).

## Updating Ruby

To install newer Ruby versions in the future:

```bash
# Check available versions
ruby-install --latest

# Install a newer version
ruby-install ruby 3.5.0

# Update shell config to use new version
# Edit ~/.zshrc and change: chruby ruby-3.5.0
```

## Resources

- [Official Jekyll macOS Installation Guide](https://jekyllrb.com/docs/installation/macos/)
- [chruby Documentation](https://github.com/postmodern/chruby)
- [ruby-install Documentation](https://github.com/postmodern/ruby-install)
- [GitHub Pages Gem](https://github.com/github/pages-gem)

## Summary

This setup provides a reliable Jekyll development environment on modern macOS systems. The key points:

1. Use `chruby` + `ruby-install` (not Homebrew Ruby)
2. Install Ruby 3.4.1 from source
3. Use `bundle exec jekyll serve` to run sites
4. Use `github-pages` gem for GitHub Pages sites
5. Start new terminal sessions or source `~/.zshrc` after configuration changes
