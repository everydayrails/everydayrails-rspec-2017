Last login: Sun Jan 13 20:58:30 on console
~ ❯❯❯ cd Program/everydayrails-rspec-2017
~/P/everydayrails-rspec-2017 ❯❯❯ ls                                                                                                                                                                                           my-02-setup ✱ ◼
Gemfile      Gemfile.lock README.md    Rakefile     app          bin          config       config.ru    db           lib          log          package.json public       spec         test         tmp          vendor
~/P/everydayrails-rspec-2017 ❯❯❯ vi config/application.rb                                                                                                                                                                     my-02-setup ✱ ◼
~/P/everydayrails-rspec-2017 ❯❯❯ vi config/application.rb                                                                                                                                                                     my-02-setup ✱ ◼
~/P/everydayrails-rspec-2017 ❯❯❯ git branch                                                                                                                                                                                   my-02-setup ✱ ◼
  master
* my-02-setup
~/P/everydayrails-rspec-2017 ❯❯❯ git diff                                                                                                                                                                                     my-02-setup ✱ ◼
diff --git a/Gemfile b/Gemfile
index ebb1da2..1d74a19 100644
--- a/Gemfile
+++ b/Gemfile
@@ -15,6 +15,8 @@ gem 'turbolinks', '~> 5'
 gem 'jbuilder', '~> 2.5'
 
 group :development, :test do
+  gem 'rspec-rails', '~> 3.6.0'
+
   gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
   gem 'capybara', '~> 2.13.0'
   gem 'selenium-webdriver'
@@ -26,6 +28,8 @@ group :development do
   gem 'spring'
   gem 'spring-watcher-listen', '~> 2.0.0'
   gem 'faker', require: false # for sample data in development
+
+  gem 'spring-commands-rspec'
 end
 
 gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
diff --git a/Gemfile.lock b/Gemfile.lock
index 7a456bc..286464e 100644
--- a/Gemfile.lock
+++ b/Gemfile.lock
@@ -77,6 +77,7 @@ GEM
       railties (>= 4.1.0, < 6.0)
       responders
       warden (~> 1.2.3)
+    diff-lcs (1.3)
     erubi (1.7.1)
     execjs (2.7.0)
     faker (1.7.3)
@@ -156,6 +157,23 @@ GEM
     responders (2.4.0)
       actionpack (>= 4.2.0, < 5.3)
       railties (>= 4.2.0, < 5.3)
+    rspec-core (3.6.0)
+      rspec-support (~> 3.6.0)
+    rspec-expectations (3.6.0)
+      diff-lcs (>= 1.2.0, < 2.0)
+      rspec-support (~> 3.6.0)
+    rspec-mocks (3.6.0)
+      diff-lcs (>= 1.2.0, < 2.0)
+      rspec-support (~> 3.6.0)
+    rspec-rails (3.6.1)
+      actionpack (>= 3.0)
+      activesupport (>= 3.0)
+      railties (>= 3.0)
+      rspec-core (~> 3.6.0)
+      rspec-expectations (~> 3.6.0)
+      rspec-mocks (~> 3.6.0)
+      rspec-support (~> 3.6.0)
+    rspec-support (3.6.0)
     ruby_dep (1.5.0)
     rubyzip (1.2.1)
     sass (3.4.23)
@@ -171,6 +189,8 @@ GEM
       websocket (~> 1.0)
     spring (2.0.1)
       activesupport (>= 4.2)
~/P/everydayrails-rspec-2017 ❯❯❯                                                                                                                                                                                              my-02-setup ✱ ◼
~/P/everydayrails-rspec-2017 ❯❯❯ clear                                                                                                                                                                                        my-02-setup ✱ ◼

~/P/everydayrails-rspec-2017 ❯❯❯ git status                                                                                                                                                                                   my-02-setup ✱ ◼
On branch my-02-setup
Your branch is up to date with 'origin/01-untested'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   Gemfile
	modified:   Gemfile.lock
	modified:   config/application.rb

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	.rspec
	bin/rspec
	spec/

no changes added to commit (use "git add" and/or "git commit -a")
~/P/everydayrails-rspec-2017 ❯❯❯ git add Gemfile                                                                                                                                                                              my-02-setup ✱ ◼
~/P/everydayrails-rspec-2017 ❯❯❯ git add                                                                                                                                                                                    my-02-setup ✚ ✱ ◼
Nothing specified, nothing added.
Maybe you wanted to say 'git add .'?
~/P/everydayrails-rspec-2017 ❯❯❯ git add .                                                                                                                                                                                  my-02-setup ✚ ✱ ◼
~/P/everydayrails-rspec-2017 ❯❯❯ git commit -m rspec_setup                                                                                                                                                                      my-02-setup ✚
[my-02-setup a33c9a9] rspec_setup
 7 files changed, 199 insertions(+), 1 deletion(-)
 create mode 100644 .rspec
 create mode 100755 bin/rspec
 create mode 100644 spec/rails_helper.rb
 create mode 100644 spec/spec_helper.rb
~/P/everydayrails-rspec-2017 ❯❯❯ git push origin my-02-setup                                                                                                                                                                    my-02-setup ⬆
Enter passphrase for key '/Users/suzumuratenma/.ssh/id_rsa': 
Counting objects: 12, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (10/10), done.
Writing objects: 100% (12/12), 4.87 KiB | 4.87 MiB/s, done.
Total 12 (delta 6), reused 5 (delta 1)
remote: Resolving deltas: 100% (6/6), completed with 6 local objects.
To github.com:Tennnna/everydayrails-rspec-2017.git
   9d947de..a33c9a9  my-02-setup -> my-02-setup
~/P/everydayrails-rspec-2017 ❯❯❯ vi Gemfile[                                                                                                                                                                                    my-02-setup ⬆
zsh: bad pattern: Gemfile[
~/P/everydayrails-rspec-2017 ❯❯❯ vi Gemfile                                                                                                                                                                                 ✘ 1 my-02-setup ⬆


















source 'https://rubygems.org'
  
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'rspec-rails', '~> 3.6.0'

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'faker', require: false # for sample data in development

  gem 'spring-commands-rspec'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'devise'
gem 'paperclip'
gem 'geocoder'