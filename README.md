# Godot Web Export Template

Automatically deploys your game builds to Web using Netlify.

Uses <https://github.com/abarichello/godot-ci> for CI.

On any push to `main`, a new build will be deployed to Netlify and available at the site URL.

Current Godot version: `4.2.1`

## Netlify setup

1. Import your GitHub repository to Netlify: <https://app.netlify.com/start>
2. Use the `gh-pages` branch to deploy.
3. Optionally, configure a custom domain (e.g., <https://TODO>)
4. Optionally, add a status badge to [README.md](README.md): `https://app.netlify.com/sites/<your-site>/configuration/general#status-badges`

## Quick tunnel share

To quickly share your local build (without having to push to GitHub), you can use `cloudflared` to create a tunnel to your local server.

If you're on Windows, you can use WSL to run the commands below.

[Install cloudflared](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/)
and download [serve.py](https://raw.githubusercontent.com/godotengine/godot/master/platform/web/serve.py) from the Godot repository:

```bash
wget https://raw.githubusercontent.com/godotengine/godot/master/platform/web/serve.py
```

Then, assuming you have a local build in `build/web`, run:

```bash
python serve.py -n -r build/web
```

and in another terminal:

```bash
cloudflared tunnel --url 0.0.0.0:8060
```
