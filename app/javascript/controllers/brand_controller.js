import { Controller } from "stimulus";
import { text_color } from "../brand/text_color";

export default class extends Controller {
  static targets = ["style"];

  connect() {
    const color = this.data.get("color");
    this.styleTarget.innerText = `.bg-brand-color { background-color: ${color} !important; }
                                  .text-brand-color { color: ${text_color(color)} !important}`;
  }
}
