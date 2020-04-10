module CreateDocument
  module Analyze
    module ParseSentences
      class ExtractFieldNames
        include Interactor

        delegate :sentences, :models_list, to: :context

        def call
          field_sentences.each { |sentence| add_field(sentence) }
        end

        private

        def field_sentences
          sentences.select { |sentence| sentence.template_kind == "field" }
        end

        def add_field(sentence)
          model_and_field_names = extract_model_and_field_names(sentence)
          model_name = model_and_field_names[0].titleize
          field_names = model_and_field_names[1..-1]

          return unless exists?(model_name)

          field_names.each do |field_name|
            models_list.select do |model|
              next unless model[:name] == model_name

              model[:fields] << field_structure(field_name)
            end
          end
        end

        def exists?(model_name)
          models_list.select { |model| model[:name] == model_name }.any?
        end

        def extract_model_and_field_names(sentence)
          sentence_text = sentence.text.delete(",").squish
          sentence_arr = split_string(sentence_text)
          template_arr = split_string(sentence.template_text)

          sentence_arr - template_arr
        end

        def field_structure(field_name)
          {
            name: field_name,
            required: false,
            type: "string"
          }
        end

        def split_string(string)
          string.split(" ")
        end
      end
    end
  end
end
