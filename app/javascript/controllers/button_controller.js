import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  disable() {
   const el = this.element.children[3].id
   console.log(el)
   const id = el.slice(-1)
   const btn = el.split('-')[1]
   let approve = document.getElementById(`btn-approve-${id}`)
     approve.toggleAttribute('disabled', true)
      let reject = document.getElementById(`btn-reject-${id}`)
      console.log(reject)
      reject.toggleAttribute('disabled', true)
  }


}