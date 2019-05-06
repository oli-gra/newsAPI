const state = {
  x: 1
}

const newsDiv = document.querySelector('#news-container')
const userDiv = document.querySelector('#user-panel')

const renderNewsBlock = (article) => {
  const newsBlock = document.createElement('article')
  newsBlock.className = "uk-child-width-1@l uk-margin"
  newsBlock.setAttribute("uk-grid", "")
  newsBlock.innerHTML = `
    <div>
      <div class="uk-card uk-card-default">
        <div class="uk-card-media-top">
          <img src="${article.urlToImage}" alt="">
        </div>
        <div class="uk-card-body">
          <h3 class="uk-card-title">${article.title}</h3>
          <p class=".uk-article-meta">${article.description}</p>
          <h6 class="uk-article-meta">${article.author}</h6>
        </div>
        <div class="uk-card-footer uk-flex uk-flex-between">
          <a href="#" class="uk-button uk-button-text">Read more</a>
          <a href="#" class="uk-button uk-button-text">Like</a>
          <a href="#" class="uk-button uk-button-text">Dislike</a>
        </div>
      </div>
    </div>
  `
  newsDiv.append(newsBlock)
}

const renderAllNews = () => {
  articles.forEach(renderNewsBlock)
}

const init = () => {
  renderAllNews()
}

init()