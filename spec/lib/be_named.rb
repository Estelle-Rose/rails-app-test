# frozen_string_literal: true

RSpec::Matchers.define :be_named do |expected|
    match do |user|
        "#{user.first_name} #{user.last_name}" == expected
    end
end
