import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = []

  connect() {
  }

  normalNav() {
    this.element.classList.remove("nav-reduced")
  }

  reducedNav() {
    this.element.classList.add("nav-reduced")
  }
}
