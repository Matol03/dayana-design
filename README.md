# Dayana Design — Portfolio Website

A minimalist, color-forward portfolio for selling website templates and taking
custom orders. Pure HTML/CSS/JS — no build step, deploys anywhere.

## Run it locally

Just open `index.html` in a browser, or serve the folder:

```powershell
# from this folder
python -m http.server 8000
# then open http://localhost:8000
```

## 1. Add your photos (only three needed)

The site uses **exactly three photos**. The website previews in the Work and
Templates sections are drawn with CSS browser mockups, so no other images are
required. Drop these three files into the `assets/` folder (each shows a colored
placeholder until you add it):

| File | Where it shows | Suggested photo |
|------|----------------|-----------------|
| `assets/portrait.jpg` | Hero (top, 4:5 portrait) | The formal shirt-and-tie sitting shot |
| `assets/about.jpg`    | About section (4:5) | The black-polo / podcast shot |
| `assets/contact.jpg`  | Round avatar in Contact section | The hand-on-chin shot |

> Tip: in Windows, save each pasted image and rename it to the filename above.
> For the round contact avatar, a square-ish crop looks best.

## 2. Edit your text

Open `index.html` and change:
- Your name / tagline in the **Hero** section
- Project names in **Selected work**
- Template names, descriptions and **prices**
- Your stats in **About** (`80+`, `7 yrs`, etc.)
- Your email — search for `hello@dayana.design` and replace everywhere

## 3. Connect Stripe (Buy buttons)

The Stripe script is already loaded in `<head>`. Each template has a `buy-slot`
with a placeholder button. Replace each placeholder with your real Stripe Buy
Button.

### Create a Buy Button (easiest, no backend)
1. In the [Stripe Dashboard](https://dashboard.stripe.com/buy-buttons), create a
   product for each template and click **Create buy button**.
2. Stripe gives you a snippet like this:

   ```html
   <stripe-buy-button
     buy-button-id="buy_btn_XXXXXXXXXXXX"
     publishable-key="pk_live_XXXXXXXXXXXX">
   </stripe-buy-button>
   ```
3. In `index.html`, find the matching `buy-slot`, e.g.:

   ```html
   <div class="buy-slot" data-template="aurora">
     <a class="btn btn--solid btn--full" href="#contact">Buy Aurora</a>
   </div>
   ```
   Replace the `<a>...</a>` placeholder with your `<stripe-buy-button>` snippet.

Repeat for each template (Aurora, Studio, Market, Bloom, Pulse).

> Prefer a simple link instead? Create a **Payment Link** in Stripe and set it as
> the button's `href`: `<a class="btn btn--solid btn--full" href="https://buy.stripe.com/...">Buy</a>`

## 4. Contact button

The **Contact me** button opens the visitor's email app pre-addressed to you.
To use a form service instead (e.g. Formspree), replace the `mailto:` link in the
`#contact` section with your form.

## Deploy (one command)

This folder is wired for one-command deploys to **Vercel**.

```powershell
npm run deploy
```

That's it. On the **first run** Vercel will:
1. Ask you to log in (`vercel login` opens your browser) — one time only.
2. Ask a few setup questions — accept the defaults:
   - *Set up and deploy?* → **Y**
   - *Which scope?* → your account
   - *Link to existing project?* → **N**
   - *Project name?* → press Enter (uses `dayana-design-portfolio`)
   - *In which directory is your code?* → press Enter (`./`)
   - *Override settings?* → **N**

When it finishes it prints your live URL (e.g. `https://dayana-design-portfolio.vercel.app`).
Every later `npm run deploy` ships an update instantly — no questions asked.

**Other handy commands**
```powershell
npm run dev             # preview locally at http://localhost:3000
npm run deploy:preview  # deploy a private preview URL (not production)
```

> Prefer clicking? Run `./deploy.ps1` (right-click → Run with PowerShell). It logs
> you in if needed, then deploys to production.

### Custom domain
After the first deploy, add your domain in the Vercel dashboard
(Project → Settings → Domains), or run `vercel domains add yourdomain.com`.
