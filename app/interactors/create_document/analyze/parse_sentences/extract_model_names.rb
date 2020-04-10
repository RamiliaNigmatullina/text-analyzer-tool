module CreateDocument
  module Analyze
    module ParseSentences
      class ExtractModelNames
        include Interactor

        delegate :sentences, :models_list, to: :context

        def call
          model_sentences.each { |sentence| add_model(sentence) }
        end

        private

        def model_sentences
          sentences.select { |sentence| sentence.template_kind == "model" }
        end

        def add_model(sentence)
          model_name = extract_model_name(sentence)

          models_list << model_structure(model_name) if uniq?(model_name)
        end

        def uniq?(model_name)
          models_list.select { |model| model[:name] == model_name }.empty?
        end

        def extract_model_name(sentence)
          sentence_arr = split_string(sentence.text)
          template_arr = split_string(sentence.template_text)

          (sentence_arr - template_arr).join("_").classify
        end

        def model_structure(model_name)
          {
            name: model_name,
            fields: []
          }
        end

        def split_string(string)
          string.split(" ")
        end
      end
    end
  end
end
