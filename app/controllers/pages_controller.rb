# require_relative 'config/openai'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home , :page ]

  def home
  end

  def page
    client = OpenAI::Client.new
    # response = OpenAI.Completion.create(
    # engine: 'text-davinci-003',
    # prompt: 'como posso aprender ruby?',
    # max_tokens: 100
    # )

    # # @generated_text = response.choices.first.text.strip
    # response = client.completions(
    #   parameters: {
    #     model: "text-davinci-001",
    #     prompt: "Once upon a time",
    #     max_tokens: 5
    #   })
    #   puts response["choices"].map { |c| c["text"] }
    response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: [
      { role: "user", content: "Qual é a capital da França?" }
    ]
  }
)
puts response.dig("choices", 0, "message", "content")
  end

end
