module Qmt
  class BaseSpecs
    attr_accessor :rspec

    def initialize(rspec, attributes)
      @rspec = rspec
      assign_attributes(attributes)
    end

    def assign_attributes(attributes)
      Hash(attributes).each do |key, value|
        writer_method = "#{key}="
        send(writer_method, value) if respond_to?(writer_method)
      end
    end

    def have_key(value)
      rspec.have_key(value)
    end

    def expect(value)
      rspec.expect(value)
    end

    def eq(value)
      rspec.eq(value)
    end

    def be_present
      rspec.be_present
    end
  end
end
