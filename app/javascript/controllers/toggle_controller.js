import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "navMenu", "opacity" ]
  static values = { isOpen: { type: Boolean, default: false}}

  menu() {
    this.isOpenValue ? this.close() : this.open();
    this.isOpenValue = !this.isOpenValue
  }

  open() {
    this.opacityTarget.classList.remove("hidden");
    this.navMenuTarget.classList.remove("-translate-x-full")
    this.navMenuTarget.classList.add("translate-x-0")
    this.navMenuTarget.classList.remove("hidden");
    
  }

  close() {
    this.opacityTarget.classList.add("hidden");
    this.navMenuTarget.classList.remove("translate-x-0") 
    this.navMenuTarget.classList.add("-translate-x-full")
    this.navMenuTarget.classList.add("hidden");
  }
}