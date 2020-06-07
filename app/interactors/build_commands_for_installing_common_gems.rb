class BuildCommandsForInstallingCommonGems
  include Interactor

  delegate :document, :position, to: :context

  def call
    generate_base_group_gems_install_commands
    generate_test_group_gems_install_commands
    generate_development_group_gems_install_commands
    generate_development_test_group_gems_install_commands
  end

  private

  def generate_base_group_gems_install_commands
    create_command(
      "bundle add active_model_serializers decent_decoration decent_exposure " \
      "devise draper interactor kaminari action_policy responders seedbank"
    )
  end

  def generate_test_group_gems_install_commands
    create_command("bundle add email_spec launchy poltergeist --group \"test\"")
  end

  def generate_development_group_gems_install_commands
    create_command("bundle add letter_opener --group \"development\"")
  end

  def generate_development_test_group_gems_install_commands
    create_command(
      "bundle add bullet bundler-audit dotenv-rails factory_bot_rails faker pry-rails " \
      "rspec-rails rubocop rubocop-rspec scss_lint slim_lint --group \"development, test\""
    )
  end

  def create_command(text)
    document.commands.create(position: position, text: text)
    increase_position
  end

  def increase_position
    context.position += 1
  end
end
