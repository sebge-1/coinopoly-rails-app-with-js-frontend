function Position(data) {
  this.id = data.id;
  this.quantity = data.quantity;
  this.coinName = data.coin.name;
  this.coinImg_url = data.coin.img_url;
  this.value = parseFloat(data.coin.value) * this.quantity
}

 // should this be delegated to portfolio ultimately?
Position.prototype.updatePortfolioValue = function() {
  let portfolioValue = $("span#portfolioValue").html()
  portfolioValue = parseFloat(portfolioValue) + this.value
  $("span#portfolioValue").html(portfolioValue)
}

Position.prototype.setupTemplate = function() {
  let positionHTML = this.renderTemplate();
  $('.card-group').append(positionHTML);
  this.updatePortfolioValue();
}

Position.prototype.renderTemplate = function() {
  return Position.template(this)
}

$(function() {
  Position.templateSource = $("#position-template-owner").html();
  Position.template = Handlebars.compile(Position.templateSource)
})
