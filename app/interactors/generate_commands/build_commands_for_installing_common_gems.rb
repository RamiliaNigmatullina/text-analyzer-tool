module GenerateCommands
  class BuildCommandsForInstallingCommonGems
    include Interactor

    delegate :document, :position_calculator, to: :context

    def call
      generate_base_group_gems_install_commands
      generate_test_group_gems_install_commands
      generate_development_group_gems_install_commands
      generate_development_test_group_gems_install_commands_1
      generate_development_test_group_gems_install_commands_2
    end

    private

    def generate_base_group_gems_install_commands
      create_command("bundle add active_model_serializers")
      create_command("bundle add decent_decoration")
      create_command("bundle add decent_exposure")
      create_command("bundle add devise")
      create_command("bundle add draper")
      create_command("bundle add interactor")
      create_command("bundle add kaminari")
      create_command("bundle add action_policy")
      create_command("bundle add responders")
      create_command("bundle add seedbank")
    end

    def generate_test_group_gems_install_commands
      create_command("bundle add capybara --group 'test'")
      create_command("bundle add email_spec --group 'test'")
      create_command("bundle add launchy --group 'test'")
      create_command("bundle add poltergeist --group 'test'")
    end

    def generate_development_group_gems_install_commands
      create_command("bundle add letter_opener --group 'development'")
      create_command("bundle add web-console --group 'development'")
    end

    def generate_development_test_group_gems_install_commands_1
      create_command("bundle add bullet --group 'development, test'")
      create_command("bundle add bundler-audit --group 'development, test'")
      create_command("bundle add dotenv-rails --group 'development, test'")
      create_command("bundle add factory_bot_rails --group 'development, test'")
      create_command("bundle add faker --group 'development, test'")
      create_command("bundle add pry-rails --group 'development, test'")
    end

    def generate_development_test_group_gems_install_commands_2
      create_command("bundle add rspec-rails --group 'development, test'")
      create_command("bundle add rubocop --group 'development, test'")
      create_command("bundle add rubocop-rspec --group 'development, test'")
      create_command("bundle add scss_lint --group 'development, test'")
      create_command("bundle add slim_lint --group 'development, test'")
    end

    def create_command(text)
      document.commands.create(position: position, text: text)
    end

    def position
      position_calculator.next_position
    end
  end
end
