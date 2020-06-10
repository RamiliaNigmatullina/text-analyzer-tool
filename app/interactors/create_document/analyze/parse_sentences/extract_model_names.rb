module CreateDocument
  module Analyze
    module ParseSentences
      class ExtractModelNames
        include Interactor

        RESERVED_WORDS = %w[there is are a an the and model models class classes].freeze

        delegate :sentences, :models_list, to: :context

        def call
          model_sentences.each { |sentence| add_model(sentence) }
        end

        private

        def model_sentences
          sentences.select { |sentence| sentence.template_kind == "model" }
        end

        def add_model(sentence)
          model_names = extract_model_names(sentence)

          model_names.each do |model_name|
            models_list << model_structure(model_name) if uniq?(model_name)
          end
        end

        def uniq?(model_name)
          models_list.select { |model| model[:name] == model_name }.empty?
        end

        def extract_model_names(sentence)
          class_names = sentence.text.split(%r{\s|,\s})
          class_names -= RESERVED_WORDS

          class_names.map(&:classify)
        end

        def model_structure(model_name)
          {
            name: model_name,
            fields: []
          }
        end
      end
    end
  end
end
