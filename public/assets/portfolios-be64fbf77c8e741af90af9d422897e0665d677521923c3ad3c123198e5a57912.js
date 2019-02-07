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
  var portfolioValue = parseFloat(this.value) + positionValue
  $("span#portfolioValue").html(portfolioValue)
}

Portfolio.prototype.createTemplate = function() {
  var portfolioHTML = HandlebarsTemplates['portfolio_template'](this)
  return portfolioHTML
}

Portfolio.prototype.renderPositions = function(templateSource) {
  var result = HandlebarsTemplates[templateSource]({positions: this.positions})
  $(".card-group").html(result)
}
;
