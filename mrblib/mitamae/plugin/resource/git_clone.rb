module ::MItamae
  module Plugin
    module Resource
      class GitClone < ::MItamae::Resource::Base
        define_attribute :action, default: :clone
        define_attribute :destination, type: String, default_name: true
        define_attribute :repository, type: String, required: true
        define_attribute :revision, type: String, default: nil
        define_attribute :recursive, type: [TrueClass, FalseClass], default: true
        define_attribute :depth, type: Integer, default: nil

        self.available_actions = [:clone, :delete]
      end
    end
  end
end
