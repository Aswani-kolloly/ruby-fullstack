class TestJob < ActiveJob::Base
    def perform
      # put you scheduled code here
      # Comments.deleted.clean_up...
      puts "hello job is getting ready"
    end
  end