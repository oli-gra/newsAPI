const state = {
  x: 1
}

const newsDiv = document.querySelector('#news-container')
const userDiv = document.querySelector('#user-panel')

const renderNewsBlock = (article) => {
  const newsBlock = document.createElement('article')
  newsBlock.innerHTML = `
  <h2>${article.title}</h2>
  <h5>${article.author}</h5>
  <img src="${article.urlToImage}">
  <p>${article.description}</p>
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