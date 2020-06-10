module CreateDocument
  module Analyze
    module ParseSentences
      class ExtractFieldTypes
        include Interactor

        RESERVED_WORDS = %w[the field column has have a the type].freeze

        delegate :sentences, :models_list, to: :context

        def call
          field_type_sentences.each { |sentence| add_type(sentence) }
        end

        private

        def field_type_sentences
          sentences.select { |sentence| sentence.template_kind == "field_type" }
        end

        def add_type(sentence)
          field_name_and_field_type = sentence.text.split(%r{\s|,\s})
          field_name_and_field_type -= RESERVED_WORDS

          field_name = field_name_and_field_type[0]
          field_type = field_name_and_field_type[1]

          models_list.each do |model|
            model[:fields].each do |field|
              field[:type] = field_type if field[:name] == field_name
            end
          end
        end
      end
    end
  end
end
