function Position(data) {
  this.id = data.id;
  this.portfolio_id = data.portfolio_id
  this.quantity = data.quantity;
  this.coinName = data.coin.name;
  this.coinImg_url = data.coin.img_url;
  this.value = parseFloat(data.coin.value) * this.quantity
}

Position.prototype.renderTemplate = function() {
  var positionHTML = HandlebarsTemplates['new_position']( this)
  $('.card-group').append(positionHTML)
  }
