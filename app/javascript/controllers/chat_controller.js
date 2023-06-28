import { Controller } from "@hotwired/stimulus"
// require('dotenv').config();

// Connects to data-controller="chat"
export default class extends Controller {
  static targets = ["info", "text"]
  connect() {
  }

  updateText() {
    console.log(this.infoTarget.value)
    const url = 'https://api.openai.com/v1/chat/completions';
    // const access_token = process.env.OPENAI_ACCESS_TOKEN;
    const access_token = "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"
    // const headers = {
    //   'Authorization': `Bearer ${access_token}`,
    //   'Content-Type': 'application/json'
    // };

    // // Prepare the request payload
    // const data = {
    //   prompt: 'Once upon a time',
    //   max_tokens: 100
    // };

    // // Send the request using fetch
    // fetch(url, {
    //   method: 'POST',
    //   headers: headers,
    //   body: JSON.stringify(data)
    // })
    //   .then(response => response.json())
    //   .then(result => {
    //     const generatedText = result.choices[0].text;
    //     console.log('Generated text:', generatedText);
    //   })
    //   .catch(error => {
    //     console.error('Request failed:', error);
    //   });
    // const url = 'https://api.openai.com/v1/chat/completions';
// const access_token = 'YOUR_OPENAI_API_KEY'; // Substitua pela sua chave de API
const headers = {
  'Content-Type': 'application/json',
  'Authorization': `Bearer ${access_token}`
};

// Prepare the request payload
const data = {
  model: 'gpt-3.5-turbo',
  messages: [{ role: 'user', content: this.infoTarget.value }],
  temperature: 0.7
};

// Send the request using fetch
fetch(url, {
  method: 'POST',
  headers: headers,
  body: JSON.stringify(data)
})
  .then(response => response.json())
  .then(result => {
    console.log(result.choices[0].message.content);
    this.textTarget.innerHTML = result.choices[0].message.content
  })
  .catch(error => {
    console.error('Request failed:', error);
    // Handle the error
  });
}
}
