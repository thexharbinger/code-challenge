import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["emailField", "emailErrorMessage", "submitButton"];

  validateEmailDomain(){
    const error = !this.emailFieldTarget.value.endsWith('@getmainstreet.com');
      this.emailFieldTarget.classList.toggle('is-invalid', error);
      this.emailErrorMessageTarget.textContent = error ? 'The email must be of domain getmainstreet.com' : '';
      this.submitButtonTarget.disabled = error;
  }
}
