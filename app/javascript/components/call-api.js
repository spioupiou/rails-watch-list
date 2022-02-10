const callApi = () => {

  const results = document.querySelector('#results');

  const searchMovies = (keyword) => {
    const apiUrl = `http://www.omdbapi.com/?s=${keyword}&apikey=d6e0d7e0`;
    fetch(apiUrl)
      .then(response => response.json())
      .then((data) => {
        data.Search.forEach((movie) => {
          const newMovie = `<li class="list-inline-item">
          <img src="${movie.Poster}">
          <p>${movie.Title}</p>
          <button class="btn btn-primary">Click Me</button>
        </li>`
          results.insertAdjacentHTML('beforeend', newMovie)
        });
      });
  };

  const searchForm = document.querySelector('#search-movies');

  if (!!searchForm) {
    searchForm.addEventListener('submit', (event) => {
      event.preventDefault();
      results.innerHTML = "";
      const keyword = document.querySelector("#keyword").value;
      searchMovies(keyword);
    });
  }
};

export { callApi };
