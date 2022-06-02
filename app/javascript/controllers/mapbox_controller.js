import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
	mapboxgl.accessToken = this.apiKeyValue

	this.map = new mapboxgl.Map({
		container: this.element,
		style: "mapbox://styles/nyaorobenjamin/cl3klqcz9002s14mnnj4o6rgq",
		center: [13.398512962068333, 52.52091578045743 ], // starting position
		zoom: 9 // starting zoom
	})

	this.#addMarkersToMap()
	this.#fitMapToMarkers()

  }
	#addMarkersToMap() {
		this.markersValue.forEach((marker) => {
			const popup = new mapboxgl.Popup().setHTML(marker.info_window)
			const customMarker = document.createElement("div")
			customMarker.className = "marker"
			customMarker.style.backgroundImage = `url('${marker.image_url}')`
			customMarker.style.backgroundSize = "contain"
			customMarker.style.width = "30px"
			customMarker.style.height = "30px"

			new mapboxgl.Marker(customMarker)
				.setLngLat([marker.lng, marker.lat])
				.setPopup(popup)
				.addTo(this.map)
		});
	}

	#fitMapToMarkers() {
		const bounds = new mapboxgl.LngLatBounds()
		this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
		this.map.fitBounds(bounds, { padding: 70, maxZoom: 16, duration: 2000 })
	}

}
