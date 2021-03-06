# Open 360 demo

Demo setup project for Open360. Open360 is a system to create, manage and run surveys in a convenient way for both employees and employers.
Please see the [github.io page](https://o360.github.io/) for more information.

This project lets you set up a complete installation of Open360 system in a simple manner.
It balances between automation of tedious stuff and providing ability to customise what might be needed to customise

> ⚠️ This manual is intended to be used only for the demonstrational deployment of open360 system.
> It is updated less often than the corresponding [frontend](https://github.com/o360/frontend)
and [backend](https://github.com/o360/backend) projects.
> We do not advice to use the result setup as production Open360 instance as is.
> For production, we recommend deploying [frontend](https://github.com/o360/frontend)
and [backend](https://github.com/o360/backend) according to their documentation.

## Requirements
- **Docker v19.03+** installed from the official Docker [website](https://docs.docker.com/install/linux/docker-ce/ubuntu/).
- **Docker Compose v1.25+** installed from the official Docker [website](https://docs.docker.com/compose/install/).

## Environment preparation

### Сlone the repository and enter the folder

```
git clone https://github.com/o360/demo.git
cd demo
```

### Set up Google account
Open360 makes use of Google Sheet API and Google Drive API to generate assesment reports, so we need to set up developer google account for that first.
We will also use Google account to configure sending emails to Open360 users using Google SMTP server.

1. Go to https://console.developers.google.com/ and create a project
2. Getting *drive_service_key.json*: 
    * Go to credentials section
    * Press "CREATE CREDENTIALS" button and choose "Service account"
    * Create credentials without role
    * Press "Create key" and select JSON format
    * JSON file will be downloaded automatically

3. Enable following APIs for project via "Library":
    * Google Drive API
    * Google Sheets API

4. Copy downloaded json file to `backend/drive_service_key.json`

5. Set `GMAIL_USER` and `GMAIL_PASSWORD` environment variables (or edit [.env](.env) file)
for the email sender account
6. Since your upcoming Open360 installation is not known to Google, it might block outgoing emails from `GMAIL_USER`.
To fix that allow *less secure apps* to sign in with that email at <https://myaccount.google.com/lesssecureapps>

### Set hostname
Set `HOSTNAME` environment variable (or edit [.env](.env) file) to point to your host name.
This value will be used to form all the public http addresses for Open360, i.e. frontend and backend endpoints.
By default the result of `hostname` unix command will be used, so if that returns the desired hostname,
you don't have to set anything additional

## Accounts

Open360 supports authentication via social networks or custom HTTP handler, but for the demonstrational installation provided in the current manual, only HTTP handler will be used, because it simplifies the deployment a lot.

You can find the information on how to set up authentication using social networks, in the corresponding
[backend](https://github.com/o360/backend#setting-up-authentication-sources) and
[frontend](https://github.com/o360/frontend/blob/master/docs/config.md#social-login) accordingly.
For the demo installation we shall use a simple HTTP authenticator that takes users data from
[users.csv](backend/users.csv). You can change this file if you want to add/remove/edit users.
First user that logs into the system, will become an admin.

## Run
1. [Prepare environment first](#environment-preparation)
2. `./start.sh`
3. To shutdown: `./stop.sh`

## Feedback
If you think that something here is missing or not working correctly, please let us know
in the issues or send us email to open360@bw-sw.com. Thank you!
