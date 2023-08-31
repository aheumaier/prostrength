// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "@nathanvda/cocoon";
import "bootstrap";
import flatpickr from "flatpickr";

require("flatpickr/dist/flatpickr.min.css");

document.addEventListener("turbolinks:load", () => {
  flatpickr(".datepicker", {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
  });
});
