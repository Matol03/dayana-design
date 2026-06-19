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

## 3. Stripe (Buy buttons) — already wired

Each template's Buy button links to a **Stripe Payment Link** and opens Stripe
Checkout in a new tab. The links live directly on the `<a>` in each `buy-slot`
in `index.html`:

| Template | `buy-slot` | Payment Link |
|----------|-----------|--------------|
| Aurora | `data-template="aurora"` | `.../test_dRm3cxex1bGPbdSaCY08g00` |
| Studio | `data-template="studio"` | `.../test_fZu14pex1fX53LqaCY08g01` |
| Market | `data-template="market"` | `.../test_00w6oJ4WrdOX4Pu8uQ08g02` |
| Bloom  | `data-template="bloom"`  | `.../test_3cI9AV74zh190zecL608g03` |
| Pulse  | `data-template="pulse"`  | `.../test_7sY00l1Kf6mv81GdPa08g04` |

### ⚠️ These are TEST links — switch to live before selling
The URLs contain `test_`, so they use Stripe **test mode** (no real money; use
card `4242 4242 4242 4242`, any future expiry/CVC to try checkout).

When you're ready to take real payments:
1. Toggle off **Test mode** in the [Stripe Dashboard](https://dashboard.stripe.com).
2. Recreate each Payment Link in **live mode** (or flip the existing ones live).
3. In `index.html`, replace each `href` with the live URL (it will **not** have
   `test_` in it). Find them by searching for `buy.stripe.com`.

To change a price/product, edit the Payment Link in Stripe — no code change
needed. To add a template, copy a `tmpl` card block and set its `href`.`

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
