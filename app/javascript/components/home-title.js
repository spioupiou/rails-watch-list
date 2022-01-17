import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#home-typed-text', {
    strings: ["Looking for a good movie to watch? ^1600"],
    typeSpeed: 40,
    loop: true
  });
}

export { loadDynamicBannerText };
