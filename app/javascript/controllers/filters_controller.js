import { Controller } from 'stimulus';
import Rails from '@rails/ujs';

export default class extends Controller {
  static targets = ['form'];

  filter() {
    Rails.fire(this.formTarget, 'submit');
  }
}

