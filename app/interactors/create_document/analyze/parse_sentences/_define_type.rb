module CreateDocument
  module Analyze
    module ParseSentences
      class DefineType
        include Interactor

        delegate :sentences, :models_list, to: :context

        def call
          sentences.each do |sentence|
            template = Template.similarity_like(sentence).first

            foo(sentence, template)
          end
        end

        private

        def foo(sentence, template)
          if template.model?
            model_name = extract_model_name(sentence, template)

            models_list << model_structure(model_name)
          elsif template.required_field?
            # add field
          end
        end

        def extract_model_name(sentence, template)
          sentence_arr = split_string(sentence)
          template_arr = split_string(template.text)

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
