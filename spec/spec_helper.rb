require 'coveralls'
require 'database_cleaner'
require 'rails_helper'

Coveralls.wear!('rails')

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # config.use_transactional_fixtures = false
  #
  #   config.before(:suite) do
  #     if config.use_transactional_fixtures?
  #       raise(<<-MSG)
  #         Delete line `config.use_transactional_fixtures = true` from rails_helper.rb
  #         (or set it to false) to prevent uncommitted transactions being used in
  #         JavaScript-dependent specs.
  #
  #         During testing, the app-under-test that the browser driver connects to
  #         uses a different database connection to the database connection used by
  #         the spec. The app's database connection would not be able to access
  #         uncommitted transaction data setup over the spec's database connection.
  #       MSG
  #     end
  #     DatabaseCleaner.clean_with(:truncation)
  #   end
  #
  #   config.before(:each) do
  #     DatabaseCleaner.strategy = :transaction
  #   end
  #
  #   config.before(:each, type: :feature) do
  #     # :rack_test driver's Rack app under test shares database connection
  #     # with the specs, so continue to use transaction strategy for speed.
  #     driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test
  #
  #     if !driver_shares_db_connection_with_specs
  #       # Driver is probably for an external browser with an app
  #       # under test that does *not* share a database connection with the
  #       # specs, so use truncation strategy.
  #       DatabaseCleaner.strategy = :truncation
  #     end
  #   end
  #
  #   config.before(:each) do
  #     DatabaseCleaner.start
  #   end
  #
  #   config.after(:each) do
  #     DatabaseCleaner.clean
  #   end


# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end
