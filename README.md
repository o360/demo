# Open 360 demo

Demo setup project for Open360. Open360 is a system to create, manage and run surveys in a convenient way for both employees and employers.
Please see the [github.io page](https://o360.github.io/) for more information.

#### Related projects
[Open360 Backend](https://github.com/o360/backend)

[Open360 Frontend](https://github.com/o360/frontend)

This project lets you set up a complete installation of Open360 system in a simple manner.
It balances between automation of tedious stuff and providing ability to customise what might be needed to customise

> This project is indented to be used only for demo purposes.
> It is updated less often than the corresponding [frontend](https://github.com/o360/frontend)
and [backend](https://github.com/o360/backend) projects.
> We do not advice to use the result setup as production Open360 instance as is.
> For production, we recommend deploying [frontend](https://github.com/o360/frontend)
and [backend](https://github.com/o360/backend) according to their documentation

## Requirements
- Docker
- Docker compose

## Configuration
Most of the environment variables and configuration files are already set/provided for you,
but there are some configuration steps you need to perform on your own:

1. [Set up Google account](https://github.com/o360/backend#setting-up-google-account)
2. Copy downloaded `drive_service_key.json` to `backend/drive_service_key.json`
3. Set up [auth sources](https://github.com/o360/backend#setting-up-authentication-sources)
    * Additional environment variables can be either put to [.env](.env) file or exported in the shell
    * For social authentication providers (if any) set **redirect urls** according to the corresponding
    `redirect_uri` values from [frontend configuration template](frontend/config.json)
4. Edit [frontend configuration template](frontend/config.json)
    * Set appropriate `client_id` values for social auth providers if you decided to use those. You DO NOT
    have to remove extra social providers templates if you don't want to. Their presence will not cause any issues
5. *Optional* See [.env](.env) file for environment variables defaults and override them if you want. If you want your server to be accesible not by `http://localhost/` but by your public domain name, edit `HOSTNAME` env variable value
and change the correspondig values in the [frontend configuration template](frontend/config.json). You may also have
to add another **redirect url** to your social authentication provider settings. If some environment variables meaning
is not clear to you, see the
[corresponding backend documentation section](https://github.com/o360/backend#environment-variables)

## Run
1. [Configure first](#configuration)
2. `docker-compose up -d`
3. To shutdown: `docker-compose down`

## Feedback
If you think that something here is missing or not working correctly, please let us know
in the issues or send us email to open360@bw-sw.com. Thank you!
