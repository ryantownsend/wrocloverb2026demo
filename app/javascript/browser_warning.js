class BrowserWarning extends HTMLElement {
  connectedCallback() {
    if (!document.body.streamAppendHTMLUnsafe) {
      this.removeAttribute('hidden');
    }
  }
}

customElements.define('browser-warning', BrowserWarning);
