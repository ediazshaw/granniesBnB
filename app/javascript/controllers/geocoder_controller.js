import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["city"]

  isValid = false;

  connect() {

    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "region"
    });
    this.geocoder.addTo(this.element)

    this.geocoder.on("result", event => {
      this.#setInputValue(event)
      this.isValid = true;
    })
    this.geocoder.on("clear", () => {
      this.#clearInputValue()
      this.isValid = false
    })

    this.geocoder.on("error", () => {
      this.#clearInputValue()
    })
    this.geocoder.on("loading", () => {
      this.#clearInputValue()
    })
  }

  #valueChanged()
  {
    console.log('blur event, isValid = ' + this.isValid)
    if (!this.isValid)
    {
      this.#clearInputValue();
    }
  }

  #setInputValue(event) {
    this.cityTarget.value = event.result["place_name"]
  }

  #clearInputValue() {
    this.cityTarget.value = ""
  }
}
