# Vynn

A social media content generation and suggestion app for small businesses

## Introduction

This project is my implementation of the Google AI Hackathon.

### Features

- Authentication with Firebase Authentication (Email)
- User and Business Info Management with Firebase Firestore
- Content Generation with the Gemini API (Google Generative AI package)
- Ability to save Contents

### Implementation

The project was implemented with custom architecture similar to MVVM where
- ViewModels are known as notifiers
- DI is done using the Riverpod Providers
- It uses the classic repository approach

### Build Limitations

- The project depends on an API Key (for using the Gemini API). While I have not committed my API Key, you can create one [here](https://aistudio.google.com/app/apikey) and create an env.json file at the root of the project and inserting your key in the value as well below.
```
{
    "geminiApiKey": "Your-API-Key"
}
```
- The web and desktop environments were not prioritized for this submission.
- Automated Tests were not prioritized for this submission.
- CI / CD was not prioritized for this submission.
- Flavors was not prioritized for this submission.
- Analytics and Error Reporting was not prioritized for this submission.

### Testing
- run `git clone git@github.com:developerjamiu/Vynn.git` in your terminal
- navigate to the directory containing the cloned project (Vynn)
- head over to `https://ai.google.dev/` to create a `geminiApiKey`
- create an `env.json` file in the root directory (check the `env-example.json` as sample)
- run `flutter run --dart-define-from-file env.json`

Built with ❤️ Powered by Google Gemini.