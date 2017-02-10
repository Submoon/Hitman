# Hitman

Hitman is a Discord bot developed in Ruby with [Discordrb](https://github.com/meew0/discordrb).
It is a project made on my personal time to learn a little bit more about Ruby. If you have some advices about Ruby, I'll be happy to hear it, so please feel free to send me a message about that! 

It is far from finished but I'm working on it.
(At this moment, the bot is still on test, and not on its own server, so it is only online when I'm launching it)

Hitman can:
- Say things you ask him to say (wow...)
- Say things you ask him to say with TTS! (Wow?)
- Tell something to someone next time he talks
- Eval [Brainfuck](https://esolangs.org/wiki/Brainfuck) code
- Make a choice between multiple possibilities
- Roll a dice
- Say something weird from Quebec (Don't ask) (Please don't be offended)
- Bitchslap someone across all the voice channels until he comes back (To infinity and beyond!)
- Save quotes, see them, delete them (See .help quote)

## Installation
Just invite this bot to your channel : https://discordapp.com/api/oauth2/authorize?client_id=273558943580553217&scope=bot

I advise you to create a role for him with all permissions. I'll create the link with authorizations another time.
## Usage

`.help` to see a list of its available commands
`.help <command>` to see a description and usage of the specified command.

## Development

After checking out the repo, run `bin/setup` to install dependencies. (Bundler must be installed: `$ gem install bundler`)

Make a copy of the file 'example.config.rb' and name it 'config.rb'.
Fill in all the details : 
- Your Discord App client ID
- Your Discord App token
- Your user ID (for eval commands for example)

```INI
configatron.client_id = your_client_id
configatron.token = 'YOUR_TOKEN'
configatron.owner_id = here_your_owner_id
```

You can then run `bin/console` to launch the bot.


## Contributing

Bug reports and pull requests are welcome on GitHub at [Submoon's Github](https://github.com/Fabien Bal-Fontaine/Hitman).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Page powered by Github Pages, with the [Jekyll](https://jekyllrb.com/) theme using the Markdown Language
