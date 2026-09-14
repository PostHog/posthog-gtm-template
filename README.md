# PostHog template for Google Tag Manager (web)

A Google Tag Manager custom template that loads the [PostHog JavaScript Web SDK](https://posthog.com/docs/libraries/js) and sends events to PostHog. You do not need a Custom HTML tag.

## Install

In your web container, go to **Templates > Tag Templates > Search Gallery** and search for PostHog.

## What it does

One template, several tag types:

| Tag type | What it does |
| --- | --- |
| Initialize PostHog | Loads `array.js` and calls `posthog.init()` with your project settings |
| Capture event | `posthog.capture(name, properties)` |
| Identify | `posthog.identify(distinctId, setProperties, setOnceProperties)` |
| Alias | `posthog.alias(alias)` |
| Reset | `posthog.reset()` |
| Opt in / Opt out | `posthog.opt_in_capturing()` / `posthog.opt_out_capturing()` |

## Setup

1. Create an **Initialize PostHog** tag. Set your project API key and region, and fire it on **Initialization - All Pages**.
2. Create your event tags. On each one, open **Advanced Settings > Tag Sequencing** and set the Initialize tag as the setup tag.

The Initialize tag reports success only after the SDK loads and initializes. Tag sequencing therefore guarantees the SDK is ready before an event tag runs.

Find your project API key in [your project settings](https://us.posthog.com/settings/project). It starts with `phc_` and is safe to expose in the browser.

## Reverse proxies and self-hosted instances

The template can only inject a script from a URL declared in its permissions, and Google requires those URLs to be fixed. The template therefore ships with the two PostHog Cloud asset hosts only.

If you use a [reverse proxy](https://posthog.com/docs/advanced/proxy) or self-host:

1. Load the SDK yourself with a Custom HTML tag that contains the [PostHog snippet](https://posthog.com/docs/libraries/js).
2. In the Initialize tag, set **Region** to **Custom host** and enter your origin.

Every other tag type works against any host.

## Consent

To hold events until a visitor consents, turn on **Start opted out of capturing** in the Initialize tag. Then fire an **Opt in to capturing** tag from your consent banner.

## Contributing

Open an issue or a pull request. If you change `template.tpl`, add a new entry at the top of the `versions` list in `metadata.yaml` with the new commit SHA and a change note. The gallery serves the revision that `metadata.yaml` names.

## License

Apache 2.0, as required for Google Tag Manager gallery templates.
