document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // const handleFavoriteSubmit = (e) => {
  //   e.preventDefault();
  //   const favoriteInput = document.querySelector(".favorite-input");
  //   const favorite = favoriteInput.value;
  //   favoriteInput.value = "";

  //   const newListLi = document.createElement("li");
  //   newListLi.textContent = favorite;
  //   const favoritesList = document.getElementById("sf-places");
  //   favoritesList.appendChild(newListLi);


  // };


  // const listSubmitButton = document.querySelector(".favorite-submit");



  // listSubmitButton.addEventListener("click", handleFavoriteSubmit);







const handleFavoriteSubmit = (e) => {
  e.preventDefault();
  
  const placeNameInput = document.querySelector(".favorite-input");
  const placeName = placeNameInput.value;
  placeNameInput.value = '';
  const ul = document.getElementById('sf-places');
  const li = document.createElement('li');
  li.textContent = placeName;
  ul.appendChild(li);
};

const listSubmitButton = document.querySelector(".favorite-submit");

listSubmitButton.addEventListener("click", handleFavoriteSubmit);
  // adding SF places as list items

  // --- your code here!



  // adding new photos

  // --- your code here!



});
