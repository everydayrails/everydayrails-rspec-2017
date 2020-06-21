# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Projects
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      # モデルスペックとコントローラスペックの定型コードはデフォルトで自動的に作成されます。
      # なぜビューはテストしないのですか？ 信頼性の高いビューのテストを作ることは非常に面倒だからです。さらにメンテナンスしようと思ったらもっと大変になります。ジェネレータを設定する際に私が述べたように、UI関連のテストは統合テストに任せようとしています。これはRails開発者の中では標準的なプラクティスです。
      g.test_framework :rspec,
                       fixtures: false, # fixtures: false はテストデータベースにレコードを作成するファイルの作成をスキップします。この設定��第4章で true に変更します。第4章以降ではファクトリを使ってテストデータを作成します。
                       view_specs: false, # view_specs: false はビュースペックを作成しないことを指定します。本書ではビュースペックを説明しません。代わりに フィーチャスペック でUIをテストします。
                       helper_specs: false, # helper_specs: false はヘルパーファイル用のスペックを作成しないことを指定します。ヘルパーファイルはRailsがコントローラごとに作成するファイルです。RSpecを自在に操れるようになってきたら、このオプションをtrueにしてヘルパーファイルをテストするようにしても良いでしょう。
                       routing_specs: false # routing_specs: false は config/routes.rb 用のスペックファイルの作成を省略します。あなたのアプリケーションが本書で説明するものと同じぐらいシンプルなら、このスペックを作らなくても問題ないと思います。しかし、アプリケーションが大きくなってルーティングが複雑になってきたら、ルー��ィングスペックを導入するのは良い考えです。
    end
  end
end
