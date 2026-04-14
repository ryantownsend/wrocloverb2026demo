if (document.body.streamAppendHTMLUnsafe) {
  navigation.addEventListener("navigate", async (event) => {
    // if we can't intercept, ignore
    if (!event.canIntercept) return;
    // if the element (or an ancestor) has opted-out, return early
    if (event.sourceElement.closest("[data-hard-navigation]")) return;
    // an alternative opt-in approach:
    // if (!event.sourceElement.closest("[data-soft-navigation]")) return;

    event.intercept({
      async handler() {
        // make the request
        const response = await fetch(event.destination.url, {
          method: event.formData ? "POST" : "GET",
          headers: new Headers({
            // favour fragments, if our server supports them
            "Accept": "text/html+fragment, text/html, */*"
          }),
          body: event.formData,
          // don't follow redirects, we'll handle manually
          redirect: "manual"
        });

        // handle redirects
        if (response.status >= 300 && response.status < 400) {
          console.info("Handling redirect to", response.headers.get("Location"));
          window.location.href = response.headers.get("Location");
          return;
        // handle our fragment response
        } else if (response.headers.get("Content-Type")?.includes("text/html+fragment")) {
          console.info("Handling fragment response");
          await response.body
            .pipeThrough(new TextDecoderStream())
            .pipeTo(document.body.streamAppendHTMLUnsafe());
        // fallback to HTML
        } else {
          requestAnimationFrame(async () => {
            console.info("Handling full HTML response");
            const html = await response.text();
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, "text/html");
            document.documentElement.replaceWith(doc.documentElement);
          });
        }
      }
    });
  });
}
