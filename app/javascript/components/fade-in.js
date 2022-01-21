import AOS from 'aos';
import 'aos/dist/aos.css'; // You can also use <link> for styles
// ..
const initAOS = () => {
  AOS.init({
    duration: 1200
  })
  console.log("Is my init working?")
};

export { initAOS };
