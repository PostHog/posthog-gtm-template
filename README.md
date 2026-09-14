# PostHog template for Google Tag Manager (web)

A Google Tag Manager custom template that loads the [PostHog JavaScript Web SDK](https://posthog.com/docs/libraries/js) and sends events to PostHog, without writing a Custom HTML tag.

> **Status: not published.** This template has not been submitted to the Community Template Gallery and has not been tested in a real container. See [Before submitting](#before-submitting).

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

1. Add the template to your container.
2. Create an **Initialize PostHog** tag. Set your project API key and region, and fire it on **Initialization - All Pages**.
3. Create your event tags. On each one, open **Advanced Settings > Tag Sequencing** and set the Initialize tag as the setup tag. The Initialize tag only reports success once the SDK has loaded and initialized, so sequencing guarantees the SDK is ready.

## Reverse proxies and self-hosted instances

The template can only inject a script from a URL declared in its permissions, and Google requires those URLs to be fixed. So it ships with the two PostHog Cloud asset hosts only.

If you use a [reverse proxy](https://posthog.com/docs/advanced/proxy) or self-host:

1. Load the SDK yourself with a Custom HTML tag containing the [PostHog snippet](https://posthog.com/docs/libraries/js).
2. In the Initialize tag, set **Region** to **Custom host** and enter your origin.

Every other tag type works normally against any host.

## Consent

To hold events until a visitor consents, turn on **Start opted out of capturing** in the Initialize tag, then fire an **Opt in to capturing** tag from your consent banner.

## Before submitting

This repository is not ready for the [Community Template Gallery](https://developers.google.com/tag-platform/tag-manager/templates/gallery). Outstanding work:

- [ ] Import `template.tpl` into the GTM template editor and confirm it loads without validation errors.
- [ ] Add a brand thumbnail to the `brand` block in `___INFO___`. The gallery shows it next to the template name.
- [ ] Write test scenarios in `___TESTS___`, which is currently empty.
- [ ] Test in a real container: SDK loading, tag sequencing, each tag type, and a consent flow.
- [x] Pin `metadata.yaml` to the commit SHA of the `template.tpl` to publish. Update it whenever `template.tpl` changes.
- [ ] Accept the gallery Developer Terms of Service in the template editor's **Info** tab.
- [ ] Make this repository public with Issues enabled, then submit at [tagmanager.google.com/gallery](https://tagmanager.google.com/gallery).

## License

Apache 2.0. Required by Google for gallery templates, and not the license PostHog uses elsewhere.
