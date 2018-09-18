function Portfolio(data) {
  this.id = data.id
  this.name = data.name;
  this.public = data.public;
  this.positions = data.positions;
  this.value = data.value
}

Portfolio.prototype.injectNameValue = function() {
  $("#name").text(this.name);
  $("#portfolioValue").text(this.value);
}

Portfolio.prototype.updatePortfolioValue = function(positionValue) {
  let portfolioValue = parseFloat(this.value) + positionValue
  $("span#portfolioValue").html(portfolioValue)
}

Portfolio.prototype.renderTemplate = function() {
  let portfolioHTML = HandlebarsTemplates['portfolio_template'](this)
  $('.card-group').append(portfolioHTML);
}

Portfolio.prototype.renderPositions = function(templateSource) {
  let result = HandlebarsTemplates[templateSource]({positions: this.positions})
  $(".card-group").html(result)
}
