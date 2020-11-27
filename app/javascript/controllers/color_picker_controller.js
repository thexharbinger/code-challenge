import { Controller } from "stimulus";
import { text_color } from "../brand/text_color";

export default class extends Controller {
  static targets = ["input", "preview", "style"];

  updatePreview(){
    const color = this.inputTarget.value;
    this.previewTarget.style.backgroundColor  = color;
    this.previewTarget.style.color = text_color(color);
  }

  connect() {
    this.updatePreview();
  }
}
