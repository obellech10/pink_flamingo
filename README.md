# Pink Flamingo

Our team designed the Pink Flamingo app over 10 days with community in mind. With work schedules and job relocation forcing people to move more frequently, it can be hard to build relationships with the people right down the street. Pink Flamingo is meant to make this task easier! Our app allows you to schedule parties, invite members within a radius of your choosing. Guest can see the events in their area, RSVP and all members will be texted reminders as the party gets closer.

Meet the Pink Flamingo Team:
- [Jori Peterson](https://github.com/JoriPeterson)
- [Oscar Bellechasse](https://github.com/obellech10)
- [Paul Schlattmann](https://github.com/pschlatt)
- [Mills Provosty](https://github.com/MillsProvosty)

[Click Here to use Pink Flamingo](https://pinkflamingoapp.herokuapp.com/)

## Built Using

* Rails 5.2.3
* Ruby 2.4.1
* Google and Facebook OAuth for user authentication
* PostgreSQL database
* Sinatra to host a micro-service API that manages a Twillio messaging system

[View the Sinatra microservice's repo here](https://github.com/pschlatt/pink_flamingo_microservice)
* Sinatra 2.0.7
* Twilio-ruby 5.26.0

## Schema

![Schema](/app/assets/images/Schema.png)

## Run Pink Flamingo on your local machine

1. `$ git clone git@github.com:obellech10/pink_flamingo.git`
2. `$ bundle`
3. `$ bundle exec figaro install` -- add your API keys to `config/application.yml`:

```yml
GOOGLE_CLIENT_ID: <your Google Client ID>
GOOGLE_CLIENT_SECRET: <your Google Client Secret>
GOOGLE_API_KEY: <your Google API key>
FACEBOOK_APP_SECRET: <your Facebook App Secret>
FACEBOOK_APP_ID: <your Facebook App ID>
```
4. `$ bundle exec rspec install`
5. `$ rails db:{create,migrate}`
6. Run test suite with `$ bundle exec rspec`
7. Start a local server with `$ rails s` -- access Pink Flamingo in your browser or Postman at `localhost:3000`
