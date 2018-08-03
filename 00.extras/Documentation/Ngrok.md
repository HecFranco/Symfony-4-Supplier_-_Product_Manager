# Manual of NGrok

[Ngrok](https://ngrok.com/) is a multiplatform tunnelling, reverse proxy software that establishes secure tunnels from a public endpoint such as internet to a locally running network service while capturing all traffic for detailed inspection and replay.

### INSTALLATION

Download the executable file of the application (it is portable) and save it to a folder from where the console will be called to execute it.

> We will use [00.extras/Plugins](./00.extras/Plugins/).

**Donwolad here, [Donwload Ngrok](https://ngrok.com/download).**

### USING NGROK

Access the folder where the [Ngrok](https://ngrok.com/) executable is located , using the console, and execute the following command.


Launch the project using `php bin/console server:run`. Write down the port your server is using, in our case `8000`.

```bash
[OK] Server listening on http://127.0.0.1:8000   
```

Launch the following command that points to the location of the executable. We will use the same port of the symfony project.

```bash
./00.extras/Plugins/ngrok.exe http 8000
```

Now, we can see the access information of the local server, [http://localhost:4040](http://localhost:4040).

We access the option of the main menu options *[state](http://localhost:4040/state)*. Now, we enter `command line` and select the url.