<p align="center">
  <img src="media/sigmund.svg"/>
</p>

<h1>
  <a href="https://www.signal.org/">
    <img src="https://user-images.githubusercontent.com/35022933/215067099-b2a98de6-a04d-4a85-9e51-001d1a750c35.png" height="50px"/>
  </a>
  Sigmund Assistant
</h1>
<p>
  <a href="https://andreiglesias.github.io/sigmund/" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="https://github.com/AndreIglesias/sigmund/blob/main/LICENSE" target="_blank">
    <img alt="License: GNU General Public License v3.0" src="https://img.shields.io/badge/License-GNU General Public License v3.0-yellow.svg" />
  </a>
</p>

> <b>Sigmund</b> is a <a href="https://www.signal.org/">Signal</a> assistant bot for finance and home organization, written in Python using <a href="https://github.com/AsamK/signal-cli">signal-cli</a>, that helps to create an organized financial gestor and to orchestrate the tasks and interaction of the home members.

<h2>
  Mind Map
</h2>
<p align="center">
  <img src="media/mind-map.png"/>
</p>

<h2 id="Setup">
Setup
</h2>
First, run the build script to install the dependencies of the project.

```bash
./bash.sh
```

In order to setup the signal-cli for the bot, it is necessary to obtain the verification token from <a href="https://signalcaptchas.org/registration/generate.html">signalcaptchas.org</a>.

(Everything after signalcaptcha:// is the captcha token.)

<img src="https://user-images.githubusercontent.com/35022933/218282005-1ae5bd63-03f5-4745-8cc2-ff0c821595e8.png"/>

And then rename the <b>dotenv</b> file to <b>.env</b> (if you don't have already) and fill the variables:

  ```
   VERSION="0.11.6"
   ACCOUNT="+00000000"
   CAPTCHA="signal-hcaptcha.23b9a0...hLHs23m"
  ```
</h2>

<h2>
  Usage
</h2>

To build the project after the setup, run:
```
docker-compose build
```

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/AndreIglesias/sigmund/issues). 

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2023 [Andre Iglesias](https://github.com/AndreIglesias).<br />
This project is [GNU General Public License v3.0](https://github.com/AndreIglesias/sigmund/blob/main/LICENSE) licensed.

