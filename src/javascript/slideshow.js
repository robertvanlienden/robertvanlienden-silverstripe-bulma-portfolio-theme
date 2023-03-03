export default class Slideshow {
  constructor() {
    const slides = document.querySelectorAll('.slide');
    const dots = document.querySelectorAll('.dot');

    if (slides.length > 0 && dots.length > 0) {
      let activeSlide = slides[0];
      activeSlide.classList.add('active-slide');
      dots.forEach((el) => {
        el.addEventListener('click', () => {
          // Get the target from the "data-target" attribute
          const { target } = el.dataset;
          const $target = document.getElementById(target);
          activeSlide.classList.toggle('active-slide');
          activeSlide = $target;
          $target.classList.toggle('active-slide');
        });
      });
    }
  }
}
