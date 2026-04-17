To make this demo work to it's fullest extent, you'll need Google Chrome Canary, launched with the following command line flags set:

```
--enable-blink-features=HTMLProcessingInstruction,DocumentPatching,NewHTMLSettingFunctions
```

The key files are:

* `app/javascript/intercept_navigations.js` - our ~600 byte JavaScript file that intercepts navigations.
* `controllers/concerns/fragment_rendering.rb` - a Rails controller concern that adds support for rendering Declarative Partial Updates.

[The talk slides from Wrocloverb 2026 are available on SpeakerDeck](https://speakerdeck.com/ryantownsend/no-build-utopia-modern-user-experiences-with-rails-and-web-standards)
